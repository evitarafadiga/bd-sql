CREATE DATABASE aula00
GO
USE aula00

CREATE TABLE alunos(
ra		INT				NOT NULL,
nome	VARCHAR(150)	NOT NULL,
idade	INT				NOT NULL
PRIMARY KEY (ra)
)

CREATE TABLE disciplinas(
cod_disc	INT				NOT NULL,
nome_disc	VARCHAR(100)	NOT NULL,
carga		INT				NOT NULL,
PRIMARY KEY (cod_disc)
)

CREATE TABLE professor(
registro	INT				NOT NULL,
nome		VARCHAR(100)	NOT NULL,
titulo_prof	INT				NOT NULL,
PRIMARY KEY (registro)
)

CREATE TABLE titulacao(
cod_titulacao		INT				NOT NULL,
titulo_titulacao	VARCHAR(100)	NOT NULL,
PRIMARY KEY (cod_titulacao)
)

CREATE TABLE curso(
cod_curso	INT				NOT NULL,
nome		VARCHAR(50)		NOT NULL,
area		VARCHAR(150)	NOT NULL,
PRIMARY KEY(cod_curso)
)

CREATE TABLE aluno_disciplina(
cod_aluno_disc		INT			NOT NULL,
ra_aluno			INT			NOT NULL,
FOREIGN KEY (cod_aluno_disc) REFERENCES disciplinas(cod_disc),
FOREIGN KEY (ra_aluno) REFERENCES alunos(ra),
PRIMARY KEY (cod_aluno_disc, ra_aluno)
)

CREATE TABLE professor_disciplina(
cod_prof_disc				INT			NOT NULL,
registro_prof_disc			INT			NOT NULL,
FOREIGN KEY (cod_prof_disc) REFERENCES disciplinas(cod_disc),
FOREIGN KEY (registro_prof_disc) REFERENCES professor(registro),
PRIMARY KEY (cod_prof_disc, registro_prof_disc)
)

CREATE TABLE disciplina_curso(
codigo_disc_curso_disciplina		INT				NOT NULL,
codigo_disc_curso_curso				INT				NOT NULL,
FOREIGN KEY (codigo_disc_curso_disciplina) REFERENCES disciplinas(cod_disc),
FOREIGN KEY (codigo_disc_curso_curso) REFERENCES curso(cod_curso),
PRIMARY KEY (codigo_disc_curso_disciplina, codigo_disc_curso_curso)
)