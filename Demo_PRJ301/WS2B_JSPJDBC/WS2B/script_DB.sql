USE [master]
GO

/****** Object:  Database [Test]    Script Date: 03/08/2020 09:35:35 ******/
CREATE DATABASE [Test]
GO

USE [Test]
GO

CREATE TABLE [dbo].[tblNumber](
	[iNum] [int] NOT NULL,
	[sResult] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblNumber] PRIMARY KEY CLUSTERED 
(
	[iNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


