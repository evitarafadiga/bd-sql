
CREATE DATABASE projetoescola;
GO
USE projetoescola;

/*
USE master;
GO
DROP DATABASE projetoescola;
GO
*/

CREATE TABLE aluno (
ra			VARCHAR(14)			NOT NULL,
nome		VARCHAR(200)		NOT NULL,
PRIMARY KEY (ra));

CREATE TABLE disciplinas (
codigo				INT							NOT NULL,
nome				VARCHAR(200)				NOT NULL,
sigla				CHAR(1)						NOT NULL,
num_aulas			INT							NOT NULL,
PRIMARY KEY (codigo));

CREATE TABLE faltas (
ra_aluno			VARCHAR(14)			NOT NULL,
codigo_disciplina	INT					NOT NULL,
dataf				DATE				NOT NULL,
presenca			VARCHAR(1)			NOT NULL,
PRIMARY KEY (ra_aluno),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo),
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra));

CREATE TABLE avaliacao (
codigo				INT				NOT NULL,
tipo				VARCHAR(200)	NOT NULL,
PRIMARY KEY (codigo));

CREATE TABLE notas (
ra_aluno			VARCHAR(14)			NOT NULL,
codigo_disciplina	INT					NOT NULL,
codigo_avaliacao	INT					NOT NULL,
nota				DECIMAL(2,1)		NOT NULL,
PRIMARY KEY (ra_aluno),
FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao(codigo),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo),
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra));

SELECT a.ra, CONVERT(CHAR(10), f.dataf, 103) AS dt_, d.codigo, f.presenca
	FROM faltas f, aluno a, disciplinas d
	WHERE	a.ra = f.ra_aluno
	AND		d.codigo = f.codigo_disciplina


SELECT a.ra, d.codigo AS disciplina_cod, av.codigo AS avaliacao_cod, n.nota
	FROM aluno a, disciplinas d, avaliacao av, notas n
	WHERE	a.ra = n.ra_aluno
	AND		d.codigo = n.codigo_disciplina
	AND		av.codigo = n.codigo_avaliacao