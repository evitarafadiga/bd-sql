/*Exerc�cios:

1. Fazer um algoritmo que leia 3 valores e retorne se os valores formam um tri�ngulo e se ele �
is�celes, escaleno ou equil�tero.
Condi��es para formar um tri�ngulo
	Nenhum valor pode ser = 0
	Um lado n�o pode ser maior que a soma dos outros 2.*/
DECLARE @l1 INT
DECLARE @l2 INT
DECLARE @l3 INT

SET @l1 = 3
SET @l2 = 3
SET @l3 = 3



--2. Fazer um algoritmo que calcule e exiba, os 15 primeiros termos da s�rie de Fibonacci
--1,1,2,3,5,8,13,21,...
--Ao final, deve calcular e exibir a soma dos 15 termos

DECLARE @a INT
DECLARE @b INT
DECLARE @aux INT
DECLARE @cont INT

SET @a = 0
SET @b = 1
SET @aux = 0
SET @cont = 15

WHILE (@cont > 0)
BEGIN
	PRINT (@a)
	SET @aux = @a
	SET @a = @b
	SET @b = @b + @aux
	SET @cont = @cont - 1
END



--3. Fazer um algoritmo que retorne se duas cadeias de caracteres s�o pal�ndromos

DECLARE @p1 VARCHAR(100)
DECLARE @p2 VARCHAR(100)

SET @p1 = 'ARARA'
SET @p2 = 'ARARA'


--4. Fazer um algoritmo que verifique em uma entrada no formato de uma frase, quantas palavras tem e exiba a quantidade de palavras.

DECLARE @frase VARCHAR (100)
DECLARE @w INT
DECLARE @y CHAR
DECLARE @z INT
SET @frase = 'l� vem o homem macaco, correndo atr�s de mim'

SET @z = LEN (@frase)
SET @w = 0

WHILE (@z > 0)
BEGIN
	IF (@y <> ' ' AND SUBSTRING (@frase, @z, 1) = ' ') 
	BEGIN
	SET @w = @w + 1
	END
SET @y = (SUBSTRING (@frase, @z, 1))		
SET @z = @z - 1	
END
IF (@y <> ' ')
BEGIN
	SET @w = @w + 1
END
PRINT (@w)
