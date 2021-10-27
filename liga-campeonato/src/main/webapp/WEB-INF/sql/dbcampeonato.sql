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
letra				VARCHAR(1)			NOT NULL,
codigo_time_grupo	INT					NOT NULL,
PRIMARY KEY (codigo_time_grupo),
FOREIGN KEY (codigo_time_grupo) REFERENCES times(codigo_time)
);

CREATE TABLE jogos (
idjogo				INT	IDENTITY			    NOT NULL,
codigo_timea		INT							NOT NULL,
codigo_timeb		INT							NOT NULL,
gols_timea			INT							NOT NULL,
gols_timeb			INT							NOT NULL,
datahora			DATE					NOT NULL,
PRIMARY KEY (idjogo),
FOREIGN KEY (codigo_timea) REFERENCES times(codigo_time),
FOREIGN KEy (codigo_timeb) REFERENCES times(codigo_time)
);

INSERT INTO times (codigo_time,nome_time, cidade, estadio) VALUES
(1,'Botafogo-SP', 'Ribeir�o Preto', 'Santa Cruz'),
(2,'Bragantino', 'Bragan�a Paulista' , 'Nabi Abi Chedid'),
(3,'Corinthians', 'S�o Paulo', 'Arena Corinthians'),
(4,'Ferrovi�ria', 'Araraquara', 'Fonte Luminosa'),
(5,'Guarani', 'Campinas', 'Brinco de Ouro da Princesa'),
(6,'Ituano', 'Itu', 'Novelli J�nior'),
(7,'Mirassol', 'Mirassol', 'Jos� Maria de Campos Maia'),
(8,'Novorizontino', 'Novo Horizonte', 'Jorge Ismael de Biasi'),
(9,'Oeste', 'Barueri', 'Arena Barueri'),
(10,'Palmeiras', 'S�o Paulo', 'Allianz Parque'),
(11,'Ponte Preta', 'Campinas', 'Mois�s Lucarelli'),
(12,'Red Bull Brasil', 'Campinas', 'Mois�s Lucarelli'),
(13,'Santos', 'Santos', 'Pacaembu'),
(14,'S�o Bento', 'Sorocaba', 'Walter Ribeiro'),
(15,'S�o Caetano', 'S�o Caetano do Sul', 'Anacletto Campanella'),
(16,'S�o Paulo', 'S�o Paulo', 'Morumbi');

--drop procedure sp_iud_time
CREATE PROCEDURE sp_iud_time (@cod CHAR(1), @codigo_time INT, 
	@nometime VARCHAR(200), @cidade VARCHAR(200), @estadio VARCHAR(200), @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO times VALUES
		(@codigo_time, @nometime, @cidade, @estadio)
		SET @saida = 'Time inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE times 
			SET nome_time = @nometime, cidade = @cidade, estadio = @estadio
			WHERE codigo_time = @codigo_time
			SET @saida = 'Time atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE times 
				WHERE codigo_time = @codigo_time
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
*/

CREATE PROCEDURE sp_iud_grupo (@cod CHAR(1), 
	@letra VARCHAR(1), @codigo_time_grupo INT, @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO grupos VALUES
		(@letra, @codigo_time_grupo)
		SET @saida = 'Grupo inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE grupos 
			SET letra = @letra
			WHERE codigo_time_grupo = @codigo_time_grupo
			SET @saida = 'Grupo atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE grupos
				WHERE codigo_time_grupo = @codigo_time_grupo
				SET @saida = 'Grupo excluido com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Codigo invalido', 16, 1)
			END
		END
	END

--INSERT INTO grupos VALUES (1, 'Z', 1)
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
		SET IDENTITY_INSERT jogos ON;
		
		INSERT INTO jogos VALUES
		(@codigo_timea, @codigo_timeb, @gols_timea, @gols_timeb, @datahora)
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
		SET IDENTITY_INSERT dbo.jogos OFF;
	END

--INSERT INTO jogos VALUES (1001, 1, 14, 3, 6, '27-09-2021');
--DROP FUNCTION fn_classificacao

GO
CREATE FUNCTION fn_classificacao (@letra VARCHAR)
RETURNS TABLE RETURN (
    SELECT nome_time,
    COUNT(1) AS partidas,
    SUM(IIF(codigo_timea = codigo_time_grupo, IIF(gols_timea > gols_timeb, 1, 0), IIF(gols_timeb > gols_timea, 1, 0))) AS vitorias,
    SUM(IIF(codigo_timea = codigo_time_grupo, IIF(gols_timea = gols_timeb, 1, 0), IIF(gols_timeb = gols_timea, 1, 0))) AS empates,
    SUM(IIF(codigo_timea = codigo_time_grupo, IIF(gols_timea < gols_timeb, 1, 0), IIF(gols_timeb < gols_timea, 1, 0))) AS derrotas,
    SUM(IIF(codigo_timea = codigo_time_grupo, gols_timea, gols_timeb)) AS gols_marcados,
    SUM(IIF(codigo_timea = codigo_time_grupo, gols_timeb, gols_timea)) AS gols_sofridos,
    SUM(IIF(codigo_timea = codigo_time_grupo, gols_timea - gols_timeb, gols_timeb - gols_timea)) AS saldo_gols,
    SUM(CASE
        WHEN (codigo_timea = codigo_time_grupo AND gols_timea > gols_timeb) OR (codigo_timeb = codigo_time_grupo AND gols_timeb > gols_timea) THEN 3
        WHEN gols_timea = gols_timeb THEN 1
    END) AS pontos
    FROM jogos, times, grupos
    WHERE (codigo_timea = codigo_time_grupo OR codigo_timeb = codigo_time_grupo)
        AND times.codigo_time = codigo_time_grupo
        AND letra = @letra
    GROUP BY nome_time
)
GO
SELECT * FROM dbo.fn_classificacao('A')
UNION ALL
SELECT * FROM dbo.fn_classificacao('B')
UNION ALL
SELECT * FROM dbo.fn_classificacao('C')
UNION ALL
SELECT * FROM dbo.fn_classificacao('D')
ORDER BY pontos DESC, vitorias DESC, gols_marcados DESC, saldo_gols DESC


--FLOOR(RAND()*(4-1+1))+1

--DROP PROCEDURE embaralha_fisher_yates;
/*
CREATE PROCEDURE embaralha_fisher_yates @i INT, @saida CHAR(1) OUTPUT
AS
	DECLARE @rand	INT = 0,
			@j		INT = 17 - 1,
			@k		INT = 0,
			@temp	INT = 0,
			@a		INT = 0,
			@b		INT = 0;
	WHILE (@j > 0)
		BEGIN
		SET @k = (RAND()*(@j-1+1))+1;
		PRINT @k;
		SET @temp = @i;
		SET @i = @k;
		SET @k = @temp;
		SET @j -= 1;
		END
GO

DECLARE @i INT = 16, @saida INT;

EXEC embaralha_fisher_yates @i, @saida = '';
PRINT @saida;
SET @i -= 1;
END

--___________________________________________________________________________________________
DROP PROCEDURE sp_divide_grupos
*/

CREATE PROCEDURE sp_divide_grupos (@saida VARCHAR(50) OUTPUT)
AS
	DISABLE TRIGGER block_insupdel_grupos ON grupos
	
	BEGIN
		  
		DELETE FROM grupos
INSERT INTO grupos (codigo_time_grupo, letra)
SELECT codigo_time, CHAR((65/*A na tabela ASCII*/ + (ROW_NUMBER() OVER (ORDER BY NEWID()) - 1) / 3)) letra
FROM times
WHERE NOT (codigo_time =  3 OR codigo_time = 10 OR codigo_time = 13 OR codigo_time = 16)
UNION
SELECT codigo_time, CHAR((65/*A*/ + (ROW_NUMBER() OVER (ORDER BY NEWID()) - 1))) letra
FROM times
WHERE (codigo_time =  3 OR codigo_time = 10 OR codigo_time = 13 OR codigo_time = 16)
	
	SELECT * FROM grupos ORDER BY letra
	SET @saida = 'Grupos gerados com sucesso'
END


CREATE PROCEDURE sp_prox_dia @weekday INTEGER, @time DATE = null OUTPUT AS BEGIN
	DECLARE @add INTEGER = 0
	DECLARE @part INTEGER

	SET @time = ISNULL(@time, GETDATE())
	SET @part = DATEPART(WEEKDAY, @time)

	IF (@part >= @weekday) BEGIN
		SET @add = 7 - @part
		SET @part = 0
	END

	SET @add = @add + (@weekday - @part)

	SET @time = DATEADD(DAY, @add, @time)
END

--DROP PROCEDURE sp_gera_partidas

CREATE PROCEDURE sp_gera_partidas (@saida VARCHAR(100) OUTPUT)
AS
		DISABLE TRIGGER block_insdel_jogos ON jogos
		
 BEGIN
		DELETE FROM jogos
		DBCC CHECKIDENT('jogos', RESEED, 1)

DECLARE @times TABLE(
	num INT IDENTITY PRIMARY KEY,
	time  INT
)
INSERT INTO @times SELECT codigo_time_grupo FROM grupos ORDER BY letra

DECLARE @i INT = 0,
		@j INT = 0,
		@a INT,
		@b INT

DECLARE @date DATE

WHILE (@i < 8) BEGIN
	EXEC sp_prox_dia 4, @date  OUTPUT
	SET @j = 0
	WHILE (@j < 8) BEGIN
		SELECT @a = time FROM @times WHERE num = 1 + (@j + @i) % 4
		SELECT @b = time FROM @times WHERE num = 9 + @j
		INSERT INTO jogos VALUES (
			@a,
			@b,
			ABS(CHECKSUM(NEWID()) % 5),
			ABS(CHECKSUM(NEWID()) % 5),
			@date
		)

		SET @j = @j + 1;
	END
		
	SET @i = @i + 1;
END
SET @i = 0
WHILE (@i < 4) BEGIN
	EXEC sp_prox_dia 4, @date  OUTPUT
	SET @j = 0
	WHILE (@j < 4) BEGIN
		SELECT @a = time FROM @times WHERE num = 1 + (@j + @i) % 4
		SELECT @b = time FROM @times WHERE num = 5 + @j
		INSERT INTO jogos VALUES (
			@a,
			@b,
			ABS(CHECKSUM(NEWID()) % 5),
			ABS(CHECKSUM(NEWID()) % 5),
			@date
		)

		SELECT @a = time FROM @times WHERE num = 9 + (@j + @i) % 4
		SELECT @b = time FROM @times WHERE num = 13 + @j
		INSERT INTO jogos VALUES (
			@a,
			@b,
			ABS(CHECKSUM(NEWID()) % 5),
			ABS(CHECKSUM(NEWID()) % 5),
			@date
		)

		SET @j = @j + 1;
	END
		
	SET @i = @i + 1;
END
SELECT * FROM jogos

END

--________________________________________________________________________________ TRIGGERS


CREATE TRIGGER block_insupdel_times ON times AFTER UPDATE, INSERT, DELETE
AS	
	BEGIN
	ROLLBACK TRANSACTION
    RAISERROR('Inserção não permitida', 16, 1)
	END

CREATE TRIGGER block_insupdel_grupos ON grupos AFTER UPDATE, INSERT, DELETE
AS 
	BEGIN
	ROLLBACK TRANSACTION
    RAISERROR('Inserção não permitida', 16, 1)
	END

CREATE TRIGGER block_insdel_jogos ON jogos AFTER INSERT, DELETE
AS 
	BEGIN
	ROLLBACK TRANSACTION
    RAISERROR('Inserção não permitida', 16, 1)
	END

--________________________________________________________________________________

SELECT * FROM jogos WHERE datahora = '27-10-2021'

SELECT idjogo, codigo_timea, codigo_timeb, gols_timea, gols_timeb, datahora FROM jogos WHERE datahora = '27-10-2021' 