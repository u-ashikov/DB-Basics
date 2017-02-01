CREATE FUNCTION ufn_IsWordComprised(@LettersSet VARCHAR(MAX),@Word VARCHAR(MAX))
RETURNS INT
AS
BEGIN
	DECLARE @IsComprised INT = 0
	DECLARE @CharIndex INT = 1
	WHILE (@CharIndex <= LEN(@Word))
	BEGIN
		IF (CHARINDEX(SUBSTRING(@Word,@CharIndex,1),@LettersSet)) = 0
		BEGIN
			RETURN 0
		END
		SET @CharIndex +=1
	END
	RETURN 1
END

PRINT [dbo].ufn_IsWordComprised('aaa','asd')