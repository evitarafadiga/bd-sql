/*Exerc�cios (Retornamos para discuss�o �s 17h45):
	
1 - Fazer um algoritmo que leia 1 n�mero e mostre se � m�ltiplo de 2,3,5 ou nenhum deles

2 - Fazer um algoritmo que inverta uma palavra e mostre a palavra original toda min�scula 
(independente da entrada) e a invertida toda mai�scula.
*/

DECLARE @num INT

SET @num = 30

IF
	(@num % 2 = 0)
BEGIN
	PRINT ('� m�ltiplo de 2.')
END
IF
	(@num % 3 = 0)
BEGIN
	PRINT ('� m�ltiplo de 3.')
END
IF
	(@num % 5 = 0)
BEGIN
	PRINT ('� m�ltiplo de 5.')
END
ELSE
	PRINT ('N�o m�ltiplo n�o :D.')


DECLARE @palavra VARCHAR(5)
SET @palavra = 'Diogo'
PRINT (LOWER (@palavra))

PRINT (UPPER(REVERSE(@palavra)))

PRINT (LEN (@palavra))