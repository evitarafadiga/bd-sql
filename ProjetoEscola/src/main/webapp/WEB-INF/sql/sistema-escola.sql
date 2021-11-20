
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
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo));

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
FOREIGN KEY (ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao(codigo),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas(codigo));

INSERT INTO aluno VALUES
('1110481822034','Fulano da Silva'),
('1110481822035','Ciclano Oliveira'),
('1110481822036','Beltrano de Souza');

INSERT INTO disciplinas VALUES
('4203010','Arquitetura e Organiza��o de Computadores','T',80),
('4203020','Arquitetura e Organiza��o de Computadores','N',80),
('4208010','Laborat�rio de Hardware','T',40),
('4226004','Banco de Dados','T',80),
('4213003','Sistemas Operacionais I','T',80),
('4213013','Sistemas Operacionais I','N',80),
('4233005','Laborat�rio de Banco de Dados','T',80),
('5005220','M�todos Para a Produ��o do Conhecimento','T',40);

INSERT INTO faltas VALUES
('1110481822034','4203010','2021-11-17','P'),
('1110481822034','4226004','2021-11-16','P'),
('1110481822034','4213003','2021-11-15','P'),
('1110481822035','4203020','2021-11-17','P'),
('1110481822035','4213013','2021-11-16','P'),
('1110481822035','4233005','2021-11-15','P'),
('1110481822036','4203010','2021-11-17','F'),
('1110481822036','4233005','2021-11-16','P'),
('1110481822036','4226004','2021-11-14','P'),
('1110481822036','5005220','2021-11-15','F');

SELECT a.ra, CONVERT(CHAR(10), f.dataf, 103) AS dt_, d.codigo, f.presenca
	FROM faltas f, aluno a, disciplinas d
	WHERE	a.ra = f.ra_aluno
	AND		d.codigo = f.codigo_disciplina

SELECT a.ra, d.codigo AS disciplina_cod, av.codigo AS avaliacao_cod, n.nota
	FROM aluno a, disciplinas d, avaliacao av, notas n
	WHERE	a.ra = n.ra_aluno
	AND		d.codigo = n.codigo_disciplina
	AND		av.codigo = n.codigo_avaliacao

SELECT d.codigo, d.nome,d.sigla, d.num_aulas, a.ra, a.nome, CONVERT(CHAR(10), f.dataf, 103) AS data_, f.presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.codigo_disciplina = 4203010

SELECT d.codigo, d.nome,d.sigla, d.num_aulas, a.ra, a.nome, CONVERT(CHAR(10), f.dataf, 103) AS dataf, f.presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.codigo_disciplina = 4203010
