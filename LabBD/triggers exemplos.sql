/*TRIGGERS - GATILHOS*/

/*
TRIGGER AFTER
CREATE TRIGGER t_nome ON tabela
FOR INSERT, UPDATE, DELETE
AS
	programa��o
	
TRIGGER INSTEAD OF
CREATE TRIGGER t_nome ON tabela
INSTEAD OF INSERT, UPDATE, DELETE
AS
	programa��o
*/

/*
As TRIGGER geram tabelas tempor�rias chamadas
INSERTED e DELETED
*/

/*
DISABLE TRIGGER t_nome ON tabela
ENABLE TRIGGER t_nome ON tabela
*/

CREATE DATABASE aulatriggers02
GO
USE aulatriggers02
GO
CREATE TABLE servico(
id		INT NOT NULL,
nome	VARCHAR(100),
preco	DECIMAL(7,2)
PRIMARY KEY(ID))
GO
CREATE TABLE depto(
codigo			INT NOT NULL,
nome			VARCHAR(100),
total_salarios	DECIMAL(7,2)
PRIMARY KEY(codigo))
GO
CREATE TABLE funcionario(
id		INT NOT NULL,
nome	VARCHAR(100),
salario DECIMAL(7,2),
depto	INT NOT NULL
PRIMARY KEY(id)
FOREIGN KEY (depto) REFERENCES depto(codigo))
GO
INSERT INTO servico VALUES
(1, 'Or�amento', 20.00),
(2, 'Manuten��o preventiva', 85.00)
GO
INSERT INTO depto (codigo, nome) VALUES
(1,'RH'),
(2,'DTI')

SELECT * FROM servico
SELECT * FROM depto
SELECT * FROM funcionario

/* Ativando modo de transa��o
BEGIN TRAN a
DELETE servico WHERE id = 3

ROLLBACK TRANSACTION

COMMIT
*/

--Exemplos:
--1) Como ficam as tabelas INSERTED e DELETED a cada opera��o em servico ?
CREATE TRIGGER t_insdel ON servico
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SELECT * FROM INSERTED
	SELECT * FROM DELETED
END

INSERT INTO servico VALUES
(3, 'Limpeza', 50.00)

UPDATE servico
SET preco = 60.00
WHERE id = 3

DELETE servico
WHERE id = 3

--ENABLE TRIGGER t_insdel ON servico
DISABLE TRIGGER t_insdel ON servico
DROP TRIGGER t_insdel

--2) Em servi�o, n�o pode deletar registros
CREATE TRIGGER t_blockdel ON servico
FOR DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('N�o � poss�vel excluir servi�os', 16, 1)
END

DELETE servico
WHERE id = 3


--3) Em servi�o, ao atualizar os valores, n�o pode atualizar
--para valores menores
CREATE TRIGGER t_updtservico ON servico
AFTER UPDATE
AS
BEGIN
	DECLARE @preco	DECIMAL(7,2),
			@npreco	DECIMAL(7,2)
	
	SELECT @preco = preco FROM DELETED
	SELECT @npreco = preco FROM INSERTED

	IF (@npreco < @preco)
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('O novo pre�o deve ser maior que o atual', 16, 1)
	END
END

UPDATE servico
SET preco = 49.00
WHERE id = 3

DISABLE TRIGGER t_updtservico ON servico
ENABLE TRIGGER t_updtservico ON servico




--4) A cada inser��o, atualiza��o ou exclus�o de funcion�rio, o total_salarios do
--   depto deve ser atualizado (aumentado ou diminu�do). Cuidado com o in�cio da 
--   database que iniciam os total_salario com NULL
SELECT * FROM funcionario
SELECT * FROM depto

CREATE TRIGGER t_updt_total_salario ON funcionario
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @salario_parcial	DECIMAL(7,2),
			@salario_final		DECIMAL(7,2),
			@depto				INT,
			@cont_ins			INT,
			@cont_del			INT

	SET @salario_final = 0
	SET @cont_ins = (SELECT COUNT(*) FROM INSERTED)
	SET @cont_del = (SELECT COUNT(*) FROM DELETED)

	IF (@cont_ins > 0)
	BEGIN
		SET @salario_parcial = (SELECT salario FROM INSERTED)
		SET @salario_final = @salario_final + @salario_parcial
		SET @depto = (SELECT depto FROM INSERTED)
	END
	IF (@cont_del > 0)
	BEGIN
		SET @salario_parcial = (SELECT salario FROM DELETED)
		SET @salario_final = @salario_final - @salario_parcial
		IF (@depto IS NULL)
		BEGIN
			SET @depto = (SELECT depto FROM DELETED)
		END
	END

	IF ((SELECT total_salarios FROM depto WHERE codigo = @depto) IS NULL)
	BEGIN --1o. funcionario do depto
		UPDATE depto
		SET total_salarios = @salario_final
		WHERE codigo = @depto
	END
	ELSE --Todos os outros
	BEGIN
		UPDATE depto
		SET total_salarios = total_salarios + @salario_final
		WHERE codigo = @depto
	END
END

DELETE funcionario
SELECT * FROM funcionario
SELECT * FROM depto

INSERT INTO funcionario VALUES
(1001, 'Fulano', 2500.00, 1)

INSERT INTO funcionario VALUES
(1002, 'Beltrano', 3000.00, 1)

INSERT INTO funcionario VALUES
(1003, 'Cicrano', 5000.00, 2)

UPDATE funcionario 
SET salario = 3500.00
WHERE id = 1002

DELETE funcionario
WHERE id = 1003

--5) N�o se pode fazer atualiza��es ou exclus�es na tabela depto.
--   Ao inv�s de fazer atualiza��es ou exclus�es, mostrar o select da tabela
CREATE TRIGGER t_instof_updt_del_depto ON depto
INSTEAD OF UPDATE, DELETE
AS
BEGIN
	SELECT * FROM depto
END

DELETE depto 
WHERE codigo = 1

UPDATE depto 
SET nome = 'TI legal'
WHERE codigo = 2

/*
...

IF ((SELECT COUNT(name) FROM sys.triggers WHERE name = 't_blockdel') = 0)
BEGIN
	CREATE TRIGGER ... 
END


*/