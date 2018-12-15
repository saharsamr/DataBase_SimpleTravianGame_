SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetMin
(
	@first_val INT,
  @second_val INT
)
RETURNS INT
AS
BEGIN
  DECLARE @minimum INT;
  IF(@first_val > @second_val)
      SET @minimum = @second_val;
  ELSE
    SET @minimum = @first_val;
  RETURN @minimum;
END
GO
