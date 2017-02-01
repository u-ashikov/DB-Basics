alter FUNCTION ufn_CalculateFutureValue(@Sum DECIMAL(14,4),@YearlyInterestRate FLOAT,@Years INT)
RETURNS DECIMAL(14,4)
AS
BEGIN
	DECLARE @FutureValue DECIMAL(14,4)
	DECLARE @YearlyInterestPowered FLOAT

	SET @YearlyInterestPowered = POWER(1+@YearlyInterestRate,@Years)
	SET @FutureValue = @Sum*@YearlyInterestPowered
	RETURN @FutureValue
END

PRINT dbo.ufn_CalculateFutureValue(123.12, 0.1,5)