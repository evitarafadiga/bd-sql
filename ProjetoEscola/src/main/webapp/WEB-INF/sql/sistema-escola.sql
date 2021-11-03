
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
PRIMARY KEY (ra_aluno, codigo_disciplina, dataf),
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
PRIMARY KEY (ra_aluno, codigo_disciplina, codigo_avaliacao),
FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao(codigo),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo),
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra));