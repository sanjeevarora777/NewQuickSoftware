USE [DrySoftBranch]
GO
/****** Object:  Table [dbo].[FactQty]    Script Date: 07/25/2012 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactQty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BranchName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotQty] [int] NULL,
	[TodayDue] [int] NULL,
	[CheckQty] [int] NULL,
	[TotalDue] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF