CREATE DATABASE dbjavafx;
GO
USE dbjavafx

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

CREATE TABLE filme (
idfilme			INT				NOT NULL,
nomeBR			VARCHAR(200)	NOT NULL,
nomeEN			VARCHAR(200)	NOT NULL,
anoLancamento	INT				NOT NULL,
sinopse			TEXT			NOT NULL
PRIMARY KEY(idfilme));

CREATE PROCEDURE sp_iud_filme (@cod CHAR(1),
	@idfilme INT, @nomeBR VARCHAR(200), @nomeEN VARCHAR(200), @anoLancamento INT, @sinopse TEXT, @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO filme VALUES
		(@idfilme, @nomeBR, @nomeEN, @anoLancamento, @sinopse)
		SET @saida = 'Filme inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE filme 
			SET nomeBR = @nomeBR
			WHERE idfilme = @idfilme
			SET @saida = 'Filme atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE filme 
				WHERE idfilme = @idfilme
				SET @saida = 'Filme excluído com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Código inválido', 16, 1)
			END
		END
	END

SELECT * FROM filme