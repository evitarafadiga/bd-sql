/*
USE master;
GO
DROP DATABASE dbcampeonato;
GO
*/

CREATE DATABASE dbcampeonato;
GO
USE dbcampeonato;

CREATE TABLE times (
codigo_time		INT					NOT NULL,
nome_time		VARCHAR(200)		NOT NULL,
cidade			VARCHAR(200)		NOT NULL,
estadio			VARCHAR(200)		NOT NULL,
PRIMARY KEY (codigo_time));

CREATE TABLE grupos (
id					INT IDENTITY(101,1)	NOT NULL,
letra				VARCHAR(1)			NOT NULL,
codigo_time_grupo	INT					NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (codigo_time_grupo) REFERENCES times(codigo_time)
);

CREATE TABLE jogos (
idjogo				INT IDENTITY (1001,1)		NOT NULL,
codigo_timea		INT							NOT NULL,
codigo_timeb		INT							NOT NULL,
gols_timea			INT							NOT NULL,
gols_timeb			INT							NOT NULL,
datahora			VARCHAR(10)					NOT NULL,
PRIMARY KEY (idjogo, codigo_timea, codigo_timeb),
FOREIGN KEY (codigo_timea) REFERENCES times(codigo_time),
FOREIGN KEy (codigo_timeb) REFERENCES times(codigo_time)
);

INSERT INTO times (codigo_time,nome_time, cidade, estadio) VALUES
(1,'Botafogo-SP', 'Ribeirão Preto', 'Santa Cruz'),
(2,'Bragantino', 'Bragança Paulista' , 'Nabi Abi Chedid'),
(3,'Corinthians', 'São Paulo', 'Arena Corinthians'),
(4,'Ferroviária', 'Araraquara', 'Fonte Luminosa'),
(5,'Guarani', 'Campinas', 'Brinco de Ouro da Princesa'),
(6,'Ituano', 'Itu', 'Novelli Júnior'),
(7,'Mirassol', 'Mirassol', 'José Maria de Campos Maia'),
(8,'Novorizontino', 'Novo Horizonte', 'Jorge Ismael de Biasi'),
(9,'Oeste', 'Barueri', 'Arena Barueri'),
(10,'Palmeiras', 'São Paulo', 'Allianz Parque'),
(11,'Ponte Preta', 'Campinas', 'Moisés Lucarelli'),
(12,'Red Bull Brasil', 'Campinas', 'Moisés Lucarelli'),
(13,'Santos', 'Santos', 'Pacaembu'),
(14,'São Bento', 'Sorocaba', 'Walter Ribeiro'),
(15,'São Caetano', 'São Caetano do Sul', 'Anacletto Campanella'),
(16,'São Paulo', 'São Paulo', 'Morumbi');

CREATE PROCEDURE sp_iud_time (@cod CHAR(1), @id INT, 
	@nometime VARCHAR(200), @cidade VARCHAR(200), @estadio VARCHAR(200), @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO times VALUES
		(@id, @nometime, @cidade, @estadio)
		SET @saida = 'Time inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE times 
			SET nome_time = @nometime, cidade = @cidade, estadio = @estadio
			WHERE codigo_time = @id
			SET @saida = 'Time atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE times 
				WHERE codigo_time = @id
				SET @saida = 'Time excluido com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Codigo invalido', 16, 1)
			END
		END
	END

/*

DROP PROCEDURE sp_iud_grupo;
GO

CREATE PROCEDURE sp_iud_grupo (@cod CHAR(1), @id INT, 
	@letra VARCHAR(1), @codigo_time_grupo INT, @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO grupos VALUES
		(@id, @letra, @codigo_time_grupo)
		SET @saida = 'Grupo inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE grupos 
			SET letra = @letra, codigo_time_grupo = @codigo_time_grupo
			WHERE id = @id
			SET @saida = 'Grupo atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE grupos
				WHERE id = @id
				SET @saida = 'Grupo excluido com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Codigo invalido', 16, 1)
			END
		END
	END

--INSERT INTO grupos VALUES (1, 'Z', 1)
*/
/*

DROP PROCEDURE sp_iud_grupo;
GO

DROP PROCEDURE sp_iud_jogo;
GO
*/

CREATE PROCEDURE sp_iud_jogo (@cod CHAR(1), @idjogo INT, 
	@codigo_timea INT, @codigo_timeb INT, @gols_timea INT, @gols_timeb INT, @datahora VARCHAR(10), @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO jogos VALUES
		(@idjogo, @codigo_timea, @codigo_timeb, @gols_timea, @gols_timeb, @datahora)
		SET @saida = 'Jogo inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE jogos 
			SET codigo_timea = @codigo_timea, codigo_timeb = @codigo_timeb, gols_timea = @gols_timea, gols_timeb = @gols_timeb, datahora = @datahora
			WHERE idjogo = @idjogo
			SET @saida = 'Jogo atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE jogos 
				WHERE idjogo = @idjogo
				SET @saida = 'Jogo excluido com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Codigo invalido', 16, 1)
			END
		END
	END

--INSERT INTO jogos VALUES (1001, 1, 14, 3, 6, '27-09-2021');

CREATE PROCEDURE mostra_score (@codigo_time INT, @nome_time INT, @pontos INT) AS
SELECT codigo_time, nome_time,
SUM(IIF(codigo_time = codigo_timea AND gols_timea > gols_timeb, 3, 0)) +
SUM(IIF(codigo_time = codigo_timeb AND gols_timeb > gols_timea, 3, 0)) +
SUM(IIF(codigo_time = codigo_timea AND gols_timea = gols_timeb, 1, 0)) +
SUM(IIF(codigo_time = codigo_timeb AND gols_timea = gols_timeb, 1, 0)) AS pontos
FROM times JOIN jogos ON times.codigo_time = jogos.codigo_timea OR times.codigo_time = jogos.codigo_timeb
GROUP BY codigo_time, nome_time
ORDER BY pontos DESC, codigo_time ASC


--select count por letra, random p/ cada insert
CREATE PROCEDURE divide_grupos (@saida VARCHAR(50) OUTPUT)
AS
DECLARE @qtdgrupos INT
SET @qtdgrupos = 0;
BEGIN
	WHILE @qtdgrupos < 16
	BEGIN
		IF @qtdgrupos < 17 AND @qtdgrupos > 12
		BEGIN
		INSERT INTO grupos (letra, codigo_time_grupo) VALUES ('A', 1+FLOOR(RAND()*16));
		END
		IF @qtdgrupos < 12 AND @qtdgrupos > 8
		BEGIN
		INSERT INTO grupos (letra, codigo_time_grupo) VALUES ('B', 1+FLOOR(RAND()*16));
		END
		IF @qtdgrupos < 8 AND @qtdgrupos > 4
		BEGIN
		INSERT INTO grupos (letra, codigo_time_grupo) VALUES ('C',1+FLOOR(RAND()*16));
		END
		IF @qtdgrupos < 4
		BEGIN
		INSERT INTO grupos (letra, codigo_time_grupo) VALUES ('D',1+FLOOR(RAND()*16));
		END
	SET @qtdgrupos = @qtdgrupos + 1;
	END
	SET @saida = 'Grupos divididos com sucesso!'
END

SELECT * FROM grupos

/*
DROP PROCEDURE divide_grupos;
GO
DROP TABLE grupos;
GO
*/


	

