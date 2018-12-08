-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE dbo.AddUserToClan
	@username VARCHAR(255),
  @role_name VARCHAR(65),
  @clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @role_id INT,
            @roles_clans_id INT,
            @uniqueness_role INT;

    SELECT @role_id = role_id , @uniqueness_role = uniqueness FROM Role
        WHERE Role.role_name = @role_name;

    IF NOT EXISTS (SELECT * FROM RolesOfClans
                    WHERE RolesOfClans.clan_name = @clan_name
                    AND RolesOfClans.role_id = @role_id)
    BEGIN
      INSERT INTO dbo.RolesOfClans (clan_name, role_id)
        VALUES (@clan_name, @role_id);
    END

    SELECT @roles_clans_id = id FROM RolesOfClans
        WHERE RolesOfClans.clan_name = @clan_name
        AND RolesOfClans.role_id = @role_id;

    IF @uniqueness_role = 1
        UPDATE UserData
            SET roles_of_clan_id = @roles_clans_id
            WHERE UserData.username = @username;
END
GO
