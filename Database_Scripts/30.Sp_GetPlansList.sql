USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserDetailsForDashboard]    Script Date: 12/11/2019 3:33:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetPlansList 2019
CREATE PROCEDURE [dbo].[Sp_GetPlansList] 
(
	@PlanYear INT
)
AS 
BEGIN

	SELECT PlanId, PlanName FROM [dbo].[PlanMaster] where PlanYear = @PlanYear

END

	