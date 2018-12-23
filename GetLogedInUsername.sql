SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION IsLogIn
(
  @username VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT username
      FROM LogedInUser
      WHERE id = (SELECT max(id) from LogedInUser)
        AND username = @username
    );
GO
