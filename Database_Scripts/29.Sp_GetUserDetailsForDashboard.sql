USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserDetailsForDashboard]    Script Date: 12/10/2019 3:01:24 PM ******/
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
	WHERE PM.PlanId=1

	--Prescription
	SELECT 201 DrugId, 'Dolo' DrugName, 101 DoseId, 'Dolo-650' DoseageName, 5 DrugQuantity, 500 DrugPrice
	union
	SELECT 201 DrugId, 'Dolo' DrugName, 101 DoseId, 'Dolo-500' DoseageName, 5 DrugQuantity, 700 DrugPrice

	--Provider
	SELECT 301 ProviderId, 'Shree Krishna Clinic' ProviderName, 'Bommanahalli, Bangalore - 560068' ProviderAddress, 987654321 ProviderPhone, 5 ProviderExperience

	--Pharmacy
	SELECT 401 PharmacyId, 'Apollo Pharmacy' PharmacyName, 'Bommanahalli, Bangalore - 560068' PharmacyAddress, 963852741 PharmacyPhone

END

	