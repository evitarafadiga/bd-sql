CREATE DATABASE unionview1
GO
USE unionview1

CREATE TABLE cliente(
	id_cliente int NOT NULL,
	nome_cliente varchar(40) NOT NULL,
	email_cliente varchar(50) NOT NULL,
	telefone_cliente char(11) NOT NULL,
	cod_cliente int NOT NULL,
PRIMARY KEY (id_cliente)
)

CREATE TABLE fornecedor(
	id_fornecedor int NOT NULL,
	nome_fornecedor varchar(40) NOT NULL,
	email_fornecedor varchar(50) NOT NULL,
	telefone_fornecedor char(11) NOT NULL,
	cod_fornecedor varchar(3) NOT NULL,
	PRIMARY KEY (id_fornecedor)
)

CREATE TABLE funcionario(
	id_func int NOT NULL,
	nome_func varchar(100) NOT NULL,
	salario_func decimal(7, 2) NULL,
	login_func char(8) NULL,
	senha_func char(8) NULL,
	PRIMARY KEY (id_func)
)

ALTER TABLE cliente
ADD cod_cliente VARCHAR(3)

ALTER TABLE funcionario
ADD cod_funcionario INT

UPDATE cliente SET cod_cliente = 'A' WHERE id_cliente = 1001
UPDATE cliente SET cod_cliente = 'B' WHERE id_cliente = 1002
UPDATE cliente SET cod_cliente = 'C' WHERE id_cliente = 1003
UPDATE cliente SET cod_cliente = 'D' WHERE id_cliente = 1004
UPDATE cliente SET cod_cliente = 'E' WHERE id_cliente = 1005

UPDATE fornecedor SET cod_fornecedor = 1 WHERE id_fornecedor = 1001
UPDATE fornecedor SET cod_fornecedor = 2 WHERE id_fornecedor = 1002
UPDATE fornecedor SET cod_fornecedor = 3 WHERE id_fornecedor = 1003
UPDATE fornecedor SET cod_fornecedor = 4 WHERE id_fornecedor = 1004
UPDATE fornecedor SET cod_fornecedor = 5 WHERE id_fornecedor = 1005

SELECT * FROM cliente
SELECT * FROM fornecedor
SELECT * FROM funcionario

--Union
	SELECT id_cliente AS id, nome_cliente AS nome, 
		email_cliente AS email, cod_cliente AS cod,
		telefone_cliente AS telefone, 'CLIENTE' AS tipo_parceiro
	FROM cliente
	UNION
	SELECT id_fornecedor AS id, nome_fornecedor AS nome,
		email_fornecedor AS email, 
		CAST(cod_fornecedor AS VARCHAR(3)) AS cod ,
		telefone_fornecedor AS telefone, 'FORNECEDOR' AS tipo_parceiro
	FROM fornecedor

--Views (Vis�es ou Exibi��es)
/*SINTAXE
CREATE (ALTER, DROP) VIEW v_nome
AS
     SELECT ...

SELECT * FROM v_nome
*/
--Exemplo:

CREATE VIEW v_agenda
AS
	SELECT id_cliente AS id, nome_cliente AS nome, 
		email_cliente AS email, cod_cliente AS cod,
		telefone_cliente AS telefone, 'CLIENTE' AS tipo_parceiro
	FROM cliente
	UNION
	SELECT id_fornecedor AS id, nome_fornecedor AS nome,
		email_fornecedor AS email, 
		CAST(cod_fornecedor AS VARCHAR(3)) AS cod ,
		telefone_fornecedor AS telefone, 'FORNECEDOR' AS tipo_parceiro
	FROM fornecedor

SELECT * FROM v_agenda

--Exemplo Join com View e Tabela
SELECT * 
FROM v_agenda ag, cliente c
WHERE ag.id = c.id_cliente
	AND id >= 1004
ORDER BY id

--Mais exemplos
CREATE VIEW v_rh
AS
	SELECT id_func, nome_func, salario_func
	FROM funcionario

SELECT * FROM v_rh

CREATE VIEW v_ti
AS
	SELECT id_func, nome_func, login_func, senha_func
	FROM funcionario

SELECT * FROM v_ti

--S� funciona se o select dentro da view for um 
--select simples de apenas uma tabela
INSERT INTO v_rh VALUES
(101, 'Fulano de Tal', 5000.00)

--Esse insert d� erro se vier na sequ�ncia do anterior
INSERT INTO v_ti VALUES
(101, 'Fulano de Tal', 'fula@123', '123mudar')

--A aplica��o deve definir se o funcion�rio j� est� cadastrado
INSERT INTO v_ti VALUES
(102, 'Beltrano de Tal', 'belt@123', '123mudar')

--Esse select n�o vai funcionar
INSERT INTO v_rh VALUES
(102, 'Beltrano de Tal', 7000.00)

UPDATE v_rh
SET salario_func = 7000.00
WHERE id_func = 102

UPDATE v_ti
SET login_func = 'fula@123', senha_func = '123mudar'
WHERE id_func = 101

DELETE v_rh 
WHERE id_func = 102