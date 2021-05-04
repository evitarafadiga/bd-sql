CREATE DATABASE LIVRARIA
GO
USE LIVRARIA

CREATE TABLE LIVRO(
codigo_livro		INT(10)			NOT NULL,
nome				VARCHAR(100)	NOT NULL,
lingua				VARCHAR(50)		NOT NULL,
ano					INT(10)			NOT NULL

PRIMARY KEY (codigo_livro) );

CREATE TABLE AUTOR(
codigo_autor	INT(10)			NOT NULL,
nome			VARCHAR(100)	NOT NULL,
nasc			DATE			NULL,
pais			VARCHAR(50)		NOT NULL,
biografia		VARCHAR(255)	NOT NULL

PRIMARY KEY (codigo_autor) );

CREATE TABLE LIVRO.AUTOR(
lcodigo_livro		INT(10)		NOT NULL,
lcodigo_autor		INT(10)		NOT NULL
PRIMARY KEY (lcodigo_livro, lcodigo_autor),
FOREIGN KEY (lcodigolivro) REFERENCES LIVRO(codigo_livro),
FOREIGN KEY (lcodigo_autor) REFERENCES AUTOR(codigo_autor) );

CREATE TABLE EDICOES(
isbn		INT(10)			NOT NULL,
preco		DECIMAL(7,2)	NOT NULL,
ano			INT(10)			NOT NULL,
num_paginas	INT(10)			NOT NULL,
qtd_estoque	INT(10)			NOT NULL,
PRIMARY KEY (isbn) );

CREATE TABLE EDITORA(
codigo_editora		INT(10)			NOT NULL,
nome				VARCHAR(50)		NOT NULL,
logradouro			VARCHAR(255)	NOT NULL,
numero				INT(10)			NOT NULL,
cep					CHAR(8)			NOT NULL,
telefone			CHAR(11)		NOT NULL,
PRIMARY KEY(codigo_editora) );

CREATE TABLE LIVRO.EDICOES.EDITORA(
edicoes_isbn			INT(10)		NOT NULL,
editora_codigo_editora	INT(10)		NOT NULL,
livro_codigo_livro		INT(10)		NOT NULL,
PRIMARY KEY(edicoes_isbn, editora_codigo_editora, livro_codigo_livro),
FOREIGN KEY(edicoes_isbn) REFERENCES EDICOES(isbn),
FOREIGN KEY(editora_codigo_editora) REFERENCES EDITORA(codigo_editora),
FOREIGN KEY(livro_codigo_livro) REFERENCES LIVRO(codigo_livro) );



