/*Exercícios (Retornamos para discussão às 17h45):
	
1 - Fazer um algoritmo que leia 1 número e mostre se é múltiplo de 2,3,5 ou nenhum deles

2 - Fazer um algoritmo que inverta uma palavra e mostre a palavra original toda minúscula 
(independente da entrada) e a invertida toda maiúscula.
*/

DECLARE @num INT

SET @num = 30

IF
	(@num % 2 = 0)
BEGIN
	PRINT ('É múltiplo de 2.')
END
IF
	(@num % 3 = 0)
BEGIN
	PRINT ('É múltiplo de 3.')
END
IF
	(@num % 5 = 0)
BEGIN
	PRINT ('É múltiplo de 5.')
END
ELSE
	PRINT ('Não múltiplo não :D.')


DECLARE @palavra VARCHAR(5)
SET @palavra = 'Diogo'
PRINT (LOWER (@palavra))

PRINT (UPPER(REVERSE(@palavra)))

PRINT (LEN (@palavra))