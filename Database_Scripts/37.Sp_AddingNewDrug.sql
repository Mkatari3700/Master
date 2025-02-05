USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddingNewDrug]    Script Date: 12/16/2019 3:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Sp_AddingNewDrug]
	@UserId INT, 
	@DosageID INT,
	@Quantity INT,
	@FrequencyID INT ,
	@HiddenDrugID INT = NULL
AS
BEGIN TRY

	DECLARE 
		@DrugID INT = (SELECT [DrugId ] FROM DrugDoseMaster WHERE DrugDoseId = @DosageID),
		@PharmacyID INT,
		@ProviderID INT,
		@PlanID INT

	SELECT 
		@PharmacyID = PharmacyID,
		@ProviderID = ProviderID, 
		@PlanID = PlanID
	FROM PatientDrugMapping WHERE UserId = @UserId

	IF(@HiddenDrugID = 0)
	BEGIN
	INSERT INTO PatientDrugMapping 
		(UserId,DrugDosageId,FrequencyId,PharmacyID,ProviderID,Quantity,CreatedDate,UpdatedDate,IsRefilling,DrugID,PlanID)
	VALUES 
		(@UserId,@DosageID,@FrequencyID,@PharmacyID,@ProviderID,@Quantity,GETDATE(),GETDATE(),0,@DrugID,@PlanID) 
	END
	ELSE
	BEGIN
		UPDATE PatientDrugMapping 
		SET DrugDosageId = @DosageID,
			FrequencyId = @FrequencyID,
			Quantity = @Quantity,
			DrugID = @DrugID,
			IsRefilling = 1
		WHERE DrugID = @HiddenDrugID
	END

END TRY
BEGIN CATCH
SELECT ERROR_LINE(),
		ERROR_MESSAGE(),
		ERROR_PROCEDURE()

END CATCH

SELECT * FROM PatientDrugMapping
