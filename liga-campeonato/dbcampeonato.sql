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
codigo_time		INT				NOT NULL,
nome_time		VARCHAR(200)	NOT NULL,
cidade			VARCHAR(200)	NOT NULL,
estadio			VARCHAR(200)	NOT NULL,
PRIMARY KEY (codigo_time));

CREATE TABLE grupos (
id					INT					NOT NULL,
letra				VARCHAR(1)			NOT NULL,
codigo_time_grupo	INT					NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (codigo_time_grupo) REFERENCES times(codigo_time)
);

CREATE TABLE jogos (
data_hora			DATE		NOT NULL,
codigo_timea		INT			NOT NULL,
codigo_timeb		INT			NOT NULL,
gols_timea			INT			NOT NULL,
gols_timeb			INT			NOT NULL,
PRIMARY KEY (data_hora, codigo_timea, codigo_timeb),
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