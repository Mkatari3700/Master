USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPharmacyList]    Script Date: 12/13/2019 2:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_GetPharmacyList] 


AS 
BEGIN

	SELECT PharmacyID, PharmacyName, [Address] as PharmacyAddress, PharmacyPhone FROM [dbo].[PharmacyMaster]

END

	