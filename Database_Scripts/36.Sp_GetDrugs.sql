USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetDrugs]    Script Date: 12/13/2019 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetUserDetailsForDashboard 101
ALTER PROCEDURE [dbo].[Sp_GetDrugs] 
(
	@UserId INT	,
	@DrugID INT = NULL
)
AS 
BEGIN
IF(@DrugID IS NULL)
BEGIN
    -- Plan Level Info
   SELECT  d.* FROM DrugMaster d
   WHERE DrugId NOT IN (SELECT DrugID  FROM PatientDrugMapping where UserId = @UserId)
END
ELSE
	 SELECT  d.* FROM DrugMaster d
   WHERE PrimaryDrugId  = @DrugID

	-- DosageInfo
	SELECT * FROM DrugDoseMaster  
	
	SELECT * FROM DoseFrequencyMaster

	SELECT  d.* FROM DrugMaster d
	WHERE DrugId = @DrugID
END