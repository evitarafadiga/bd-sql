/*

USE master;
GO
DROP DATABASE dbfilmes;
GO

DROP PROCEDURE sp_iud_filme;
GO
*/

CREATE DATABASE dbfilmes;
GO
USE dbfilmes;
GO

CREATE TABLE filme (
idfilme			INT				NOT NULL,
nomeBR			VARCHAR(200)	NOT NULL,
nomeEN			VARCHAR(200)	NOT NULL,
anoLancamento	INT				NOT NULL,
sinopse			VARCHAR(500),
PRIMARY KEY (idfilme));
GO

CREATE PROCEDURE sp_iud_filme (@cod CHAR(1), @id INT, 
	@nomeBR VARCHAR(200), @nomeEN VARCHAR(200), @anoLancamento INT, @sinopse TEXT, @saida VARCHAR(50) OUTPUT)
AS
	IF (UPPER(@cod) = 'I')
	BEGIN
		INSERT INTO filme VALUES
		(@id, @nomeBR, @nomeEN, @anoLancamento, @sinopse)
		SET @saida = 'Filme inserido com sucesso'
	END
	ELSE
	BEGIN
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE filme 
			SET nomeBR = @nomeBR, nomeEN = @nomeEN, anoLancamento = @anoLancamento, sinopse = @sinopse
			WHERE idfilme = @id
			SET @saida = 'Filme atualizado com sucesso'
		END
		ELSE
		BEGIN
			IF (UPPER(@cod) = 'D')
			BEGIN
				DELETE filme 
				WHERE idfilme = @id
				SET @saida = 'Filme excluido com sucesso'
			END
			ELSE
			BEGIN
				RAISERROR('Codigo invalido', 16, 1)
			END
		END
	END


SELECT * FROM filme

SELECT film.idfilme AS idFilme, film.nomeBR AS nomePtBr, film.nomeEN AS nomeIngles,
	film.anoLancamento AS anoLancamento, film.sinopse AS sinopseFilme
FROM filme film

INSERT INTO filme VALUES ( 1,	'Clube da Luta', 'Fight Club', 1999, 'Um homem deprimido que sofre de insônia conhece um estranho vendedor chamado Tyler Durden e se vê morando em uma casa suja depois que seu perfeito apartamento é destruído. A dupla forma um clube com regras rígidas onde homens lutam. A parceria perfeita é comprometida quando uma mulher, Marla, atrai a atenção de Tyler.');
INSERT INTO filme VALUES ( 2, 'Brooklyn', 'Brooklyn', 2015, '...');
