create database  [PRJ321_FALL20_B5]
go
USE [PRJ321_FALL20_B5]
GO
/****** Object:  Table [dbo].[Artice]    Script Date: 12/16/2020 2:01:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Artice](
	[articleid] [int] NOT NULL,
	[title] [varchar](150) NOT NULL,
	[publisheddate] [date] NOT NULL,
 CONSTRAINT [PK_Artice] PRIMARY KEY CLUSTERED 
(
	[articleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/16/2020 2:01:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Author](
	[authorid] [int] NOT NULL,
	[authorname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[authorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Author_Article]    Script Date: 12/16/2020 2:01:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author_Article](
	[authorid] [int] NOT NULL,
	[articleid] [int] NOT NULL,
 CONSTRAINT [PK_Author_Article] PRIMARY KEY CLUSTERED 
(
	[authorid] ASC,
	[articleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Author_Paper]    Script Date: 12/16/2020 2:01:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author_Paper](
	[paperid] [int] NOT NULL,
	[authorid] [int] NOT NULL,
 CONSTRAINT [PK_Author_Paper] PRIMARY KEY CLUSTERED 
(
	[paperid] ASC,
	[authorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paper]    Script Date: 12/16/2020 2:01:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paper](
	[paperid] [int] NOT NULL,
	[title] [varchar](150) NOT NULL,
	[publisheddate] [date] NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[paperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Artice] ([articleid], [title], [publisheddate]) VALUES (1000, N'Article 1000', CAST(N'2000-12-25' AS Date))
INSERT [dbo].[Artice] ([articleid], [title], [publisheddate]) VALUES (1001, N'Article 1001', CAST(N'1996-09-08' AS Date))
INSERT [dbo].[Artice] ([articleid], [title], [publisheddate]) VALUES (1002, N'Article 1002', CAST(N'1995-03-02' AS Date))
INSERT [dbo].[Author] ([authorid], [authorname]) VALUES (1000, N'mr A')
INSERT [dbo].[Author] ([authorid], [authorname]) VALUES (1001, N'mr B')
INSERT [dbo].[Author] ([authorid], [authorname]) VALUES (1002, N'mr C')
INSERT [dbo].[Author_Article] ([authorid], [articleid]) VALUES (1000, 1000)
INSERT [dbo].[Author_Article] ([authorid], [articleid]) VALUES (1000, 1001)
INSERT [dbo].[Author_Article] ([authorid], [articleid]) VALUES (1000, 1002)
INSERT [dbo].[Author_Article] ([authorid], [articleid]) VALUES (1002, 1002)
INSERT [dbo].[Author_Paper] ([paperid], [authorid]) VALUES (1000, 1000)
INSERT [dbo].[Author_Paper] ([paperid], [authorid]) VALUES (1000, 1001)
INSERT [dbo].[Author_Paper] ([paperid], [authorid]) VALUES (1000, 1002)
INSERT [dbo].[Author_Paper] ([paperid], [authorid]) VALUES (1002, 1002)
INSERT [dbo].[Paper] ([paperid], [title], [publisheddate]) VALUES (1000, N'Paper 1000', CAST(N'2000-12-25' AS Date))
INSERT [dbo].[Paper] ([paperid], [title], [publisheddate]) VALUES (1001, N'Paper 1001', CAST(N'1996-09-08' AS Date))
INSERT [dbo].[Paper] ([paperid], [title], [publisheddate]) VALUES (1002, N'Paper 1002', CAST(N'1995-03-02' AS Date))
ALTER TABLE [dbo].[Author_Article]  WITH CHECK ADD  CONSTRAINT [FK_Author_Article_Artice] FOREIGN KEY([articleid])
REFERENCES [dbo].[Artice] ([articleid])
GO
ALTER TABLE [dbo].[Author_Article] CHECK CONSTRAINT [FK_Author_Article_Artice]
GO
ALTER TABLE [dbo].[Author_Article]  WITH CHECK ADD  CONSTRAINT [FK_Author_Article_Author] FOREIGN KEY([authorid])
REFERENCES [dbo].[Author] ([authorid])
GO
ALTER TABLE [dbo].[Author_Article] CHECK CONSTRAINT [FK_Author_Article_Author]
GO
ALTER TABLE [dbo].[Author_Paper]  WITH CHECK ADD  CONSTRAINT [FK_Author_Paper_Author] FOREIGN KEY([authorid])
REFERENCES [dbo].[Author] ([authorid])
GO
ALTER TABLE [dbo].[Author_Paper] CHECK CONSTRAINT [FK_Author_Paper_Author]
GO
ALTER TABLE [dbo].[Author_Paper]  WITH CHECK ADD  CONSTRAINT [FK_Author_Paper_Paper] FOREIGN KEY([paperid])
REFERENCES [dbo].[Paper] ([paperid])
GO
ALTER TABLE [dbo].[Author_Paper] CHECK CONSTRAINT [FK_Author_Paper_Paper]
GO