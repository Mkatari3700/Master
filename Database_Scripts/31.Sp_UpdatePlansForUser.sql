USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePlansForUser]    Script Date: 12/12/2019 3:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_UpdatePlansForUser]
	@UserId INT,
	@PlanId INT
AS
BEGIN TRY

	UPDATE [dbo].[PatientDrugMapping] SET PlanId = @PlanId WHERE UserId = @UserId

END TRY
BEGIN CATCH
SELECT ERROR_LINE(),
		ERROR_MESSAGE(),
		ERROR_PROCEDURE()

END CATCH
