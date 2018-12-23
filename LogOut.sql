SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.LogOut
AS
BEGIN
  UPDATE LogedInUser
    set username = NULL
     WHERE id = (SELECT max(id) from LogedInUser)
END
GO
