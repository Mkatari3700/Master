USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserDetailsForDashboard]    Script Date: 12/11/2019 7:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetUserDetailsForDashboard 101
ALTER PROCEDURE [dbo].[Sp_GetUserDetailsForDashboard] 
(
	@UserId INT
)
AS 
BEGIN

	--Plan
	SELECT PM.PlanId, PM.PlanName, PM.PlanYear, PT.PlanTypeId, PT.PlanTypeName
	FROM [dbo].[PlanMaster] PM
		JOIN [dbo].[PlanType] PT on PM.PlanTypeId=PT.PlanTypeId
	WHERE PM.PlanId=@UserId

	SELECT D.DrugId,DrugName,DrugDoseId AS DoseId ,DosageName DoseageName,4 DrugQuantity,UnitCost DrugPrice,FrequencyName  FROM DrugMaster D
	JOIN DrugDoseMaster DD ON D.DrugId= DD.[DrugId ]
	JOIN PatientDrugMapping p ON dd.DrugDoseId =  p.DrugDosageId
	JOIN DoseFrequencyMaster f ON f.FrequencyId = p.FrequencyId
	WHERE p.UserId = @UserId

	SELECT pm.ProviderId,ProviderName,ProviderAddress,ProviderPhone,ProviderExperience FROM ProviderMaster pm
	JOIN PatientDrugMapping p ON pm.ProviderId = p.ProviderID
	WHERE p.UserId = @UserId

	----Provider
	--SELECT 301 ProviderId, 'Shree Krishna Clinic' ProviderName, 'Bommanahalli, Bangalore - 560068' ProviderAddress, 987654321 ProviderPhone, 5 ProviderExperience

	--Pharmacy
	SELECT 401 PharmacyId, 'Apollo Pharmacy' PharmacyName, 'Bommanahalli, Bangalore - 560068' PharmacyAddress, 963852741 PharmacyPhone

END

	