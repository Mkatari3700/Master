USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserDetailsForDashboard]    Script Date: 12/12/2019 5:30:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetUserDetailsForDashboard 1
ALTER PROCEDURE [dbo].[Sp_GetUserDetailsForDashboard] 
(
	@UserId INT
)
AS 
BEGIN

	--Plan
	SELECT DISTINCT PM.PlanId, PM.PlanName, PM.PlanYear, PT.PlanTypeId, PT.PlanTypeName
	FROM [dbo].[PatientDrugMapping] PDM
		JOIN [dbo].[PlanMaster] PM on PDM.PlanId = PM.PlanId
		JOIN [dbo].[PlanType] PT on PM.PlanTypeId=PT.PlanTypeId
	WHERE PDM.UserId = @UserId

	SELECT D.DrugId, DrugName, DrugDoseId AS DoseId ,DosageName DoseageName,Quantity DrugQuantity,UnitCost DrugPrice,FrequencyName  
	FROM DrugMaster D
	JOIN DrugDoseMaster DD ON D.DrugId= DD.[DrugId]
	JOIN PatientDrugMapping p ON dd.DrugId =  p.DrugID and p.DrugDosageId = DD.DrugDoseId
	JOIN DoseFrequencyMaster f ON f.FrequencyId = p.FrequencyId 
	WHERE p.UserId = @UserId

	SELECT DISTINCT pm.ProviderId,ProviderName,ProviderAddress,ProviderPhone,ProviderExperience 
	FROM ProviderMaster pm
		JOIN PatientDrugMapping p ON pm.ProviderId = p.ProviderID
	WHERE p.UserId = @UserId

	SELECT DISTINCT P.PharmacyId, PM.PharmacyName, PM.[Address] as PharmacyAddress, PM.PharmacyPhone 
	FROM [PharmacyMaster] PM
		JOIN PatientDrugMapping P ON PM.PharmacyID = P.PharmacyID
	WHERE P.UserId = @UserId

END

	