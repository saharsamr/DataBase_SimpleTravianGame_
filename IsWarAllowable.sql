SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.IsWarAllowable (
	@first_clan VARCHAR(255),
	@second_clan VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @first_clan_level INT,
			@second_clan_level INT,
			@result INT;

	SELECT @first_clan_level = dbo.GetPropertyAmount(@first_clan, 'clan_level');
	SELECT @second_clan_level = dbo.GetPropertyAmount(@second_clan, 'clan_level');

	IF (ABS(@first_clan_level - @second_clan_level) <= 1)
		SET @result = 1;
	ELSE
		SET @result = 0;

	RETURN @result
END
GO
