/*
USE master;
GO
DROP DATABASE projetoescola;
GO
*/

CREATE DATABASE projetoescola;
GO
USE projetoescola;

CREATE TABLE aluno (
ra			VARCHAR(14)			NOT NULL,
nome_a		VARCHAR(200)		NOT NULL,
PRIMARY KEY (ra));

CREATE TABLE disciplinas (
codigo				INT							NOT NULL,
nome_d				VARCHAR(200)				NOT NULL,
sigla				VARCHAR(3)					NOT NULL,
turno				VARCHAR(1)					NOT NULL,
num_aulas			INT							NOT NULL,
PRIMARY KEY (codigo));

CREATE TABLE faltas (
ra_aluno			VARCHAR(14)			NOT NULL,
codigo_disciplina	INT					NOT NULL,
dataf				DATE				NOT NULL,
presenca			INT				NOT NULL,
PRIMARY KEY (ra_aluno, codigo_disciplina, dataf),
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo));

CREATE TABLE avaliacao (
codigo_a			INT				NOT NULL,
tipo				VARCHAR(200)	NOT NULL,
PRIMARY KEY (codigo_a));

CREATE TABLE notas (
ra_aluno			VARCHAR(14)			NOT NULL,
codigo_disciplina	INT					NOT NULL,
codigo_avaliacao	INT					NOT NULL,
nota				DECIMAL(2,1)		NOT NULL,
PRIMARY KEY (ra_aluno, codigo_disciplina, codigo_avaliacao),
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao(codigo_a),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo));
-- drop table situacao
CREATE TABLE situacao (
ra_					VARCHAR(14)			NOT NULL,
codigo_d			INT					NOT NULL,
codigo_a			INT					NOT NULL,
media_final			DECIMAL(3,1)		NOT NULL,
situacao			VARCHAR(50)			NOT NULL,
PRIMARY KEY (ra_, codigo_d, codigo_a),
FOREIGN KEY (ra_) REFERENCES aluno(ra),
FOREIGN KEY (codigo_a) REFERENCES avaliacao(codigo_a),
FOREIGN KEY (codigo_d) REFERENCES disciplinas(codigo));

INSERT INTO situacao VALUES
('1110481822034', '4203010', '1001', '10','APROVADO');

INSERT INTO aluno VALUES
('1110481822034','Fulano da Silva'),
('1110481822035','Ciclano Oliveira'),
('1110481822036','Beltrano de Souza'),
('1110481822037','Titrano de Tal'),
('1110481822038','Kelly Reichardt'),
('1110481822039','John Magaro'),
('1110481822040','Orion Lee');

INSERT INTO disciplinas VALUES
('4203010','Arquitetura e Organizacao de Computadores','AOC','T',80),
('4203020','Arquitetura e Organizacao de Computadores','AOC','N',80),
('4208010','Laboratorio de Hardware','LHW','T',40),
('4226004','Banco de Dados','BDO','T',80),
('4213003','Sistemas Operacionais I','SOI','T',80),
('4213013','Sistemas Operacionais I','SOI','N',80),
('4233005','Laboratorio de Banco de Dados','LBD','T',80),
('5005220','Metodos Para a Producao do Conhecimento','MPC','T',40);

INSERT INTO faltas VALUES
('1110481822034','4203010','2021-01-01','0'),
('1110481822035','4203010','2021-01-01','0'),
('1110481822036','4203010','2021-01-01','0'),
('1110481822037','4203010','2021-01-01','0'),
('1110481822038','4203010','2021-01-01','0'),
('1110481822039','4203010','2021-01-01','0'),
('1110481822040','4203010','2021-01-01','0');

INSERT INTO avaliacao VALUES
('1001','P1'),
('1002','P2'),
('1003','P3');

INSERT INTO notas VALUES
('1110481822034','4203010','1001','6.0'),
('1110481822035','4203010','1001','6.0'),
('1110481822036','4203010','1001','6.0'),
('1110481822037','4203010','1001','6.0'),
('1110481822038','4203010','1001','6.0'),
('1110481822039','4203010','1001','6.0'),
('1110481822040','4203010','1001','6.0');

--DROP PROCEDURE media_aritmetica
CREATE PROCEDURE peso_notas (@codigo INT, @tipo VARCHAR(200), @nota DECIMAL(3,1) OUTPUT) 
AS
	DECLARE @peso3 DECIMAL(2,1) = 0.3, @peso33 DECIMAL(3,2) = 0.333, 
	@peso35 DECIMAL(2,2) = 0.35, @peso5 DECIMAL(2,1) = 0.5, @peso2 DECIMAL(2,1) = 0.2, @peso8 DECIMAL(2,1) = 0.8
BEGIN
		IF (@codigo = '4203010')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso3;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso5;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
		IF (@codigo = '4203020')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso3;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso5;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
		IF (@codigo = '4208010')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso3;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso5;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
		IF (@codigo = '4208010')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso3;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso5;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
		IF (@codigo = '4226004')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso3;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso5;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
		IF (@codigo = '4213003')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso35;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso35;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso3;
				END
		END
		IF (@codigo = '4213013')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso35;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso35;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso3;
				END
		END
		IF (@codigo = '4233005')
		BEGIN
			IF (@tipo = 'P1')
				BEGIN
				SET @nota = @nota * @peso33;
				END
			IF (@tipo = 'P2')
				BEGIN
				SET @nota = @nota * @peso33;
				END
			IF (@tipo = 'T')
				BEGIN
				SET @nota = @nota * @peso33;
				END
		END
		IF (@codigo = '5005220')
		BEGIN
			IF (@tipo = 'MNC')
				BEGIN
				SET @nota = @nota * @peso8;
				END
			IF (@tipo = 'MNR')
				BEGIN
				SET @nota = @nota * @peso2;
				END
		END
END

CREATE PROCEDURE media_aritmetica (@codigo INT, @tipo VARCHAR(200), @nota1 DECIMAL(3,1), @nota2 DECIMAL(3,1), @nota3 DECIMAL(3,1), @media DECIMAL(3,1) OUTPUT)
AS
BEGIN
	EXECUTE peso_notas @codigo, @tipo, @nota1 OUTPUT
	EXECUTE peso_notas @codigo, @tipo, @nota2 OUTPUT
	IF (@nota3 IS NOT NULL)
		BEGIN
		EXECUTE peso_notas @codigo, @tipo, @nota3 OUTPUT
		SET @media = SUM(@nota1 + @nota2 + @nota3);
		END
	SET @media = SUM(@nota1 + @nota2);
END

SELECT a.ra, CONVERT(CHAR(10), f.dataf, 103) AS dt_, d.codigo, f.presenca
	FROM faltas f, aluno a, disciplinas d
	WHERE	a.ra = f.ra_aluno
	AND		d.codigo = f.codigo_disciplina

SELECT a.ra, d.codigo AS disciplina_cod, av.codigo_a AS avaliacao_cod, n.nota
	FROM aluno a, disciplinas d, avaliacao av, notas n
	WHERE	a.ra = n.ra_aluno
	AND		d.codigo = n.codigo_disciplina
	AND		av.codigo_a = n.codigo_avaliacao

SELECT d.codigo, d.nome_d,d.sigla,d.turno, d.num_aulas, a.ra, a.nome_a, CONVERT(CHAR(10), f.dataf, 103) AS data_, f.presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.codigo_disciplina = 4203010

SELECT d.codigo, d.nome_d,d.sigla, d.num_aulas, a.ra, a.nome_a, CONVERT(CHAR(10), f.dataf, 103) AS dataf, f.presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.codigo_disciplina = 4203010

--DROP TABLE faltas
SELECT * FROM faltas

SELECT * FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.dataf = '2021-11-17' AND f.codigo_disciplina = '4203010'

SELECT * FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND a.ra LIKE '111048%'

SELECT DISTINCT ra, nome_a, sigla, turno, presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND a.ra LIKE '111048%' AND f.dataf = '2021-01-01' 

SELECT a.ra, d.codigo AS disciplina_cod, av.codigo_a AS avaliacao_cod, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND	av.codigo_a = n.codigo_avaliacao AND n.codigo_avaliacao = '1001' 

SELECT DISTINCT a.ra, a.nome_a, d.sigla, d.turno, d.codigo, av.codigo_a, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND	av.codigo_a = n.codigo_avaliacao

SELECT ra, nome_a, sigla, turno, presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND a.ra LIKE '111048%' AND f.dataf = '2021-01-01' 

DECLARE @ra VARCHAR, @nome_a VARCHAR, @sigla VARCHAR, @turno VARCHAR, @codigo INT, 
@codigo_a INT, @presenca INT, @tipo VARCHAR, @nota DECIMAL(3,1), @mediafinal DECIMAL(3,1), @situacao VARCHAR

-- peso pre exame @peso33 DECIMAL(3,2) = 0.333
/*
DECLARE @notinha DECIMAL(3,1) = 10.0, @codigo INT = '4203010', @tipo VARCHAR(200) = 'P1',
					@nota1 DECIMAL(3,1) = 10.0, @nota2 DECIMAL(3,1) = 10.0, @nota3 DECIMAL(3,1) = NULL
EXECUTE media_aritmetica @codigo, @tipo, @nota1, @nota2, @nota3, @notinha OUTPUT
SELECT @notinha

DROP PROCEDURE media_aritmetica

DECLARE @notinha DECIMAL(3,1) = 10.0;
EXEC peso_notas '4233005', 'P1', @notinha OUTPUT
SELECT @notinha 
*/

SELECT a.ra, a.nome_a, d.sigla, d.turno, d.codigo AS disciplina_cod, av.codigo_a AS avaliacao_cod, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = n.codigo_avaliacao 

SELECT a.ra, a.nome_a, d.sigla, d.turno, d.codigo AS disciplina_cod, av.codigo_a AS avaliacao_cod, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = '1004'

SELECT a.ra, a.nome_a, d.sigla, d.turno, d.codigo AS disciplina_cod, av.codigo_a AS avaliacao_cod, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = n.codigo_avaliacao AND n.codigo_disciplina = '4203010' AND n.codigo_avaliacao = '1001' 

SELECT a.ra, a.nome_a, d.sigla, d.turno, d.codigo, av.codigo, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = n.codigo_avaliacao

SELECT * FROM notas

SELECT a.ra, a.nome_a, d.codigo, d.sigla, d.turno, av.codigo_a, av.tipo, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND	av.codigo_a = n.codigo_avaliacao AND n.codigo_avaliacao = '1001' AND av.tipo = 'P1'

--DROP FUNCTION fn_relatorio_notas
CREATE FUNCTION fn_relatorio_notas()
RETURNS @tabela TABLE(
		ra			VARCHAR,
		nome_a		VARCHAR(200),
		codigo		INT,
		sigla		VARCHAR,
		codigo_a	INT,
		turno		VARCHAR(1),
		tipo		VARCHAR,
		nota		DECIMAL(3,1),
		media_final	DECIMAL(3,1),
		situacao	VARCHAR(50))
AS
BEGIN
	DECLARE @ra			VARCHAR,
			@nome_a		VARCHAR(200),
			@codigo		INT,
			@sigla		VARCHAR,
			@codigo_a	INT,
			@turno		VARCHAR,	
			@tipo		VARCHAR,
			@nt1		DECIMAL(3,1),
			@media_final DECIMAL(3,1),
			@situacao	VARCHAR(200)
	DECLARE c CURSOR FOR
		SELECT a.ra, a.nome_a, d.codigo, d.sigla, d.turno, av.codigo_a, av.tipo, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = n.codigo_avaliacao
	OPEN c
	FETCH NEXT FROM c INTO @ra, @nome_a, @codigo, @sigla, @turno, @codigo_a, @tipo, @nt1
	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC peso_notas @codigo, @tipo, @nt1 OUTPUT
			EXECUTE media_aritmetica @codigo, @tipo, @nt1, '10.0', '10.0', @media_final OUTPUT
			IF (@media_final > 6.0)
				BEGIN
					SET @situacao = 'APROVADO'
					INSERT INTO @tabela VALUES
					(@ra, @nome_a, @codigo, @sigla, @codigo_a, @turno, @tipo, @nt1, @media_final, @situacao)
				END
			SET @situacao = 'REPROVADO'
				FETCH NEXT FROM c INTO @ra, @nome_a, @codigo, @sigla, @codigo_a, @turno, @tipo, @nt1, @media_final, @situacao
		END
		CLOSE c;
		DEALLOCATE c;
		RETURN
END

SELECT * FROM fn_relatorio_notas()

/*
DROP PROCEDURE relatorio_notas
*/
CREATE PROCEDURE relatorio_notas(@saida VARCHAR(50) OUTPUT)
AS
BEGIN
	DECLARE @tabela TABLE(
		ra			VARCHAR,
		nome_a		VARCHAR(200),
		codigo		INT,
		sigla		VARCHAR(3),
		turno		VARCHAR(1),
		codigo_a	INT,
		tipo		VARCHAR,
		nota		DECIMAL(3,1),
		media_final	DECIMAL(3,1),
		situacao	VARCHAR(50))
	DECLARE 
			@ra			VARCHAR,
			@nome_a		VARCHAR(200),
			@codigo		INT,
			@sigla		VARCHAR(3),
			@turno		VARCHAR(1),	
			@codigo_a	INT,
			@tipo		VARCHAR,
			@nt1		DECIMAL(3,1),
			@media_final DECIMAL(3,1),
			@situacao	VARCHAR(200)
	DECLARE c CURSOR FOR
		SELECT a.ra, a.nome_a, d.codigo, d.sigla, d.turno, av.codigo_a, av.tipo, 
		n.nota, s.media_final, s.situacao FROM aluno a, disciplinas d, avaliacao av, notas n, situacao s 
		WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND av.codigo_a = n.codigo_avaliacao 
		AND s.codigo_d = n.codigo_disciplina
	OPEN c
	FETCH NEXT FROM c INTO @ra, @nome_a, @codigo, @sigla, @turno, @codigo_a, @tipo, @nt1, @media_final, @situacao
	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC peso_notas @codigo, @tipo, @nt1 OUTPUT
			EXECUTE media_aritmetica @codigo, @tipo, @nt1, @nt1, @nt1, @media_final OUTPUT
			IF (@media_final > 6.0)
				BEGIN
					SET @situacao = 'APROVADO'
					INSERT INTO @tabela VALUES
										(@ra, @nome_a, @codigo, @sigla, @turno, @codigo_a, @tipo, @nt1, @media_final, @situacao)
				END
			SET @situacao = 'REPROVADO'
				FETCH NEXT FROM c INTO @ra, @nome_a, @codigo, @sigla, @turno, @codigo_a, @tipo, @nt1, @media_final, @situacao
		END

		CLOSE c
		DEALLOCATE c
		SELECT * FROM @tabela
		SET @saida = 'Sucesso! :D'
END

DECLARE @saida VARCHAR(50);
EXEC relatorio_notas @saida OUTPUT
SELECT @saida

SELECT * FROM situacao

SELECT ra, nome_a, [2021-01-01] AS '01', [2021-11-26] AS '02'
FROM 
	(SELECT a.ra, a.nome_a, f.presenca, f.dataf FROM faltas f, aluno a WHERE a.ra = f.ra_aluno) 
	AS sourcetable PIVOT
	(MAX(presenca) FOR dataf IN  ([2021-01-01], [2021-11-26]))
AS novatable;

SELECT SUBSTRING(dataf, 1, 1) AS dataa FROM faltas

SELECT ra, nome_a, [2021-01-01] AS [01], [2021-11-26] AS [02]
FROM 
	(SELECT a.ra, a.nome_a, f.presenca, f.dataf FROM faltas f, aluno a WHERE a.ra = f.ra_aluno) 
	AS sourcetable PIVOT
	(MAX(presenca) FOR dataf IN  ([2021-01-01], [2021-11-26]))
AS novatable;