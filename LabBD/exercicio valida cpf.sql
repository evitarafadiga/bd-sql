CREATE PROCEDURE VALID_CPF(@input AS CHAR(11), @output AS BIT OUTPUT) AS
    DECLARE @sum as INTEGER
    DECLARE @count as INTEGER
    DECLARE @digit_1 as CHAR(1)
    DECLARE @digit_2 as CHAR(1)
    DECLARE @letter AS CHAR(1)
    
    SET @letter = SUBSTRING(@input, 1, 1)
    SET @count = 11
    WHILE(@count > 0) BEGIN
        if (CONVERT(CHAR, SUBSTRING(@input,@count,1)) <> @letter) BEGIN BREAK END
        SET @count = @count - 1
    END
    If (@count = 0) BEGIN
        SET @output = 0
        RAISERROR('DIGITOS IGUAIS', 16, 1)
        RETURN
    END
    
    SET @sum = 0;
    SET @count = 10;

    WHILE(@count >= 2) BEGIN
        SET @sum = @sum + (CONVERT(INT, SUBSTRING(@input,11 - @count,1)) * @count)
        SET @count = @count - 1
    END
    
    IF (@sum % 11 < 2) BEGIN SET @digit_1 = '0' END
    ELSE BEGIN SET @digit_1 = CONVERT(CHAR,11 - (@sum % 11)) END
    
    SET @sum = 0;
    SET @count = 11;

    WHILE(@count >= 2) BEGIN
        SET @sum = @sum + (CONVERT(INT, SUBSTRING(@input,12 - @count,1)) * @count)
        SET @count = @count - 1
    END
    
    IF (@sum % 11 < 2) BEGIN SET @digit_2 = '0' END
    ELSE BEGIN SET @digit_2 = CONVERT(CHAR,11 - (@sum % 11)) END
    
    if (SUBSTRING(@input, 10, 2) = (@digit_1 + @digit_2)) BEGIN
        SET @output = 1
    END ELSE BEGIN SET @output = 0 END

DECLARE @output AS BIT
EXEC VALID_CPF '33595095014', @output OUTPUT
SELECT @output