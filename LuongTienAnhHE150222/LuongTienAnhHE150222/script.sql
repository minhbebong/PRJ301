USE [master]
GO
/****** Object:  Database [ChopHouse]    Script Date: 11/09/2021 11:02:09 PM ******/
CREATE DATABASE [ChopHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChopHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChopHouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChopHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChopHouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChopHouse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChopHouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChopHouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChopHouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChopHouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChopHouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChopHouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChopHouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChopHouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChopHouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChopHouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChopHouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChopHouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChopHouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChopHouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChopHouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChopHouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChopHouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChopHouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChopHouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChopHouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChopHouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChopHouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChopHouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChopHouse] SET RECOVERY FULL 
GO
ALTER DATABASE [ChopHouse] SET  MULTI_USER 
GO
ALTER DATABASE [ChopHouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChopHouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChopHouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChopHouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChopHouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChopHouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChopHouse', N'ON'
GO
ALTER DATABASE [ChopHouse] SET QUERY_STORE = OFF
GO
USE [ChopHouse]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartID] [int] NULL,
	[ProductDetailID] [varchar](8) NULL,
	[quantity] [int] NULL,
	[SumPrice] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [varchar](5) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ProductID] [varchar](8) NOT NULL,
	[path] [varchar](50) NOT NULL,
	[numth] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[OrderDate] [date] NULL,
	[SendDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](1000) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[TotalPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NULL,
	[ProductDetailID] [varchar](8) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[discount] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ProductDetailID] [varchar](8) NOT NULL,
	[ProductID] [varchar](8) NOT NULL,
	[colorID] [int] NOT NULL,
	[sizeID] [int] NOT NULL,
	[UnitInStock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](8) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CatID] [varchar](5) NOT NULL,
	[SubCatID] [varchar](5) NULL,
	[Price] [int] NOT NULL,
	[Material] [nvarchar](20) NULL,
	[AddDate] [date] NULL,
	[describe] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[Name] [nvarchar](50) NULL,
	[Dob] [date] NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Address] [nvarchar](500) NULL,
	[username] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCatID] [varchar](5) NOT NULL,
	[CatID] [varchar](5) NOT NULL,
	[SubCatName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 11/09/2021 11:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[username] [varchar](20) NULL,
	[ProductID] [varchar](8) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [username]) VALUES (1, N'Jun')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (2, N'ta')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (3, N'mrtat')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (4, N'lta')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (5, N'busn')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (6, N'phuon')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (7, N'trung')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (8, N'phong')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (9, N'tom')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (10, N'duke')
INSERT [dbo].[Cart] ([CartID], [username]) VALUES (11, N'qwertty')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Categories] ([CatID], [Name]) VALUES (N'1S', N'Theo 1 set')
INSERT [dbo].[Categories] ([CatID], [Name]) VALUES (N'AL', N'Áo lót')
INSERT [dbo].[Categories] ([CatID], [Name]) VALUES (N'BB', N'Đồ bầu và sau sinh')
INSERT [dbo].[Categories] ([CatID], [Name]) VALUES (N'DN', N'Đồ ngủ')
INSERT [dbo].[Categories] ([CatID], [Name]) VALUES (N'QL', N'Quần lót')
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (1, N'đỏ')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (2, N'cam')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (3, N'vàng')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (4, N'xanh nước biển')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (5, N'xanh lá cây')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (6, N'xanh da trời')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (7, N'tím')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (8, N'đen')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (9, N'trắng')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (10, N'hồng')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (11, N'nâu')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (12, N'be')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (13, N'tím than')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (14, N'xám')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S01', N'images/1S01/1S0101.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S01', N'images/1S01/1S0102.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S01', N'images/1S01/1S0103.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S01', N'images/1S01/1S0104.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S02', N'images/1S02/1S0201.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S02', N'images/1S02/1S0202.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S02', N'images/1S02/1S0203.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S04', N'images/1S04/1S0401.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S04', N'images/1S04/1S0402.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S05', N'images/1S05/1S0501.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'S05', N'images/1S05/1S0502.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/1.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/2.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/3.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/4.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/5.jpg', 5)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S50', N'images/1S50/6.jpg', 6)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/1.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/2.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/3.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/4.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/5.jpg', 5)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/6.jpg', 6)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/7.jpg', 7)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/8.jpg', 8)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'1S51', N'images/1S51/9.jpg', 9)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A01', N'images/A01/A0101.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A01', N'images/A01/A0102.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A01', N'images/A01/A0103.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A01', N'images/A01/A0104.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A01', N'images/A01/A0105.jpg', 5)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A02', N'images/A02/A0201.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A02', N'images/A02/A0202.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A02', N'images/A02/A0203.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A03', N'images/A03/A0301.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A03', N'images/A03/A0302.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A03', N'images/A03/A0303.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A06', N'images/A06/A0601.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A06', N'images/A06/A0602.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A06', N'images/A06/A0603.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A07', N'images/A07/A0704.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A07', N'images/A07/A0705.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A07', N'images/A07/A0706.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A07', N'images/A07/A0707.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A08', N'images/A08/A0801.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A08', N'images/A08/A0802.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'A08', N'images/A08/A0803.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'AB01', N'images/AB01/AB0101.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'AB01', N'images/AB01/AB0102.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'AB01', N'images/AB01/AB0103.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN03', N'images/DN03/DN0301.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN03', N'images/DN03/DN0302.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN03', N'images/DN03/DN0303.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN03', N'images/DN03/DN0304.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN04', N'images/DN04/DN0401.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN04', N'images/DN04/DN0402.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN04', N'images/DN04/DN0403.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN04', N'images/DN04/DN0404.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN04', N'images/DN04/DN0405.jpg', 5)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN05', N'images/DN05/DN0501.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN05', N'images/DN05/DN0502.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN05', N'images/DN05/DN0503.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'DN05', N'images/DN05/DN0504.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q03', N'images/Q03/Q0301.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q03', N'images/Q03/Q0302.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q03', N'images/Q03/Q0303.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q03', N'images/Q03/Q0304.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q03', N'images/Q03/Q0305.jpg', 5)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q04', N'images/Q04/Q0401.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q04', N'images/Q04/Q0402.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q05', N'images/Q05/Q0501.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q05', N'images/Q05/Q0502.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q05', N'images/Q05/Q0503.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q05', N'images/Q05/Q0504.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q06', N'images/Q06/Q0601.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q06', N'images/Q06/Q0602.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q06', N'images/Q06/Q0603.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'Q06', N'images/Q06/Q0604.jpg', 4)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB01', N'images/QB01/QB0101.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB01', N'images/QB01/QB0102.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB01', N'images/QB01/QB0103.jpg', 3)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB02', N'images/QB02/QB0201.jpg', 1)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB02', N'images/QB02/QB0202.jpg', 2)
INSERT [dbo].[Images] ([ProductID], [path], [numth]) VALUES (N'QB02', N'images/QB02/QB0203.jpg', 3)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (1, N'lta', CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09' AS Date), CAST(N'2021-02-10' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 2000000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (2, N'lta', CAST(N'2021-10-22' AS Date), CAST(N'2021-10-22' AS Date), CAST(N'2021-10-23' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (3, N'lta', CAST(N'2021-10-22' AS Date), CAST(N'2021-10-22' AS Date), CAST(N'2021-10-23' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (4, N'Jun', CAST(N'2021-10-24' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (5, N'Jun', CAST(N'2021-10-20' AS Date), CAST(N'2021-10-22' AS Date), CAST(N'2021-10-23' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (6, N'phong', CAST(N'2021-10-15' AS Date), CAST(N'2021-10-15' AS Date), CAST(N'2021-10-15' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (7, N'ta', CAST(N'2021-10-22' AS Date), CAST(N'2021-10-22' AS Date), CAST(N'2021-10-23' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (8, N'ta', CAST(N'2021-10-22' AS Date), CAST(N'2021-10-22' AS Date), CAST(N'2021-10-23' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (9, N'tom', CAST(N'2021-10-15' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (10, N'ta', CAST(N'2021-10-14' AS Date), CAST(N'2021-10-15' AS Date), CAST(N'2021-11-04' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (11, N'phuon', CAST(N'2021-10-14' AS Date), CAST(N'2021-10-16' AS Date), CAST(N'2021-10-16' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (12, N'duke', CAST(N'2021-10-17' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (13, N'Jun', CAST(N'2021-10-10' AS Date), CAST(N'2021-10-12' AS Date), CAST(N'2021-10-12' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (14, N'mrtat', CAST(N'2021-10-11' AS Date), CAST(N'2021-10-13' AS Date), CAST(N'2021-10-13' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (15, N'Jun', CAST(N'2021-10-09' AS Date), CAST(N'2021-10-09' AS Date), CAST(N'2021-10-10' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (16, N'Jun', CAST(N'2021-10-09' AS Date), CAST(N'2021-10-09' AS Date), CAST(N'2021-10-10' AS Date), N'Mr.Tat', N'Hà Đông, Hà Nội', N'0123456789', 210000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (17, N'Jun', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), NULL, N'Kiều Thắm', N'Lai Châu', N'0123456789', 877000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (18, N'phuon', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Ngô Phươn', N'Hòa Bình', N'0123879542', 866000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (19, N'busn', CAST(N'2021-11-04' AS Date), NULL, NULL, N'Đăng Bá', N'Bắc Ninh', N'0122233456', 888000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (20, N'duke', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Vũ Phong', N'Hà Nội', N'0123456789', 161000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (21, N'duke', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), NULL, N'Vũ Phong', N'Hà Nội', N'0123456789', 16000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (22, N'mrtat', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), NULL, N'Lương Anh', N'Hà Nội', N'0123456789', 1796000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (23, N'phong', CAST(N'2021-11-04' AS Date), NULL, NULL, N'Phong Tuấn Vũ', N'Chiến Thắng, Hà Nội', N'0123456789', 960000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (24, N'ta', CAST(N'2021-11-04' AS Date), NULL, NULL, N'Tiến Anh', N'Đại học FPT', N'0123456789', 1280000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (25, N'Jun', CAST(N'2021-11-04' AS Date), NULL, NULL, N'Kiều Thắm', N'Lai Châu', N'0123456789', 469000.0000)
INSERT [dbo].[Order] ([OrderID], [username], [OrderDate], [SendDate], [ShippedDate], [CustomerName], [Address], [PhoneNumber], [TotalPrice]) VALUES (26, N'qwertty', CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), N'Luong Tien Anh', N'hoa lac ha noi', N'0522909921', 129000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (1, N'1S5102', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (1, N'1S5001', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (1, N'A020136', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (1, N'DN0502', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (1, N'Q0502XL', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (2, N'1S5006', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (2, N'A060136', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (2, N'DN0302', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (2, N'Q0602L', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (2, N'S0501', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (3, N'1S5103', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (3, N'A020234', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (3, N'DN0503', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (3, N'DN0303', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (3, N'S0401', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (4, N'1S5005', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (4, N'1S5108', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (5, N'A020238', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (5, N'A060236', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (5, N'A070536', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (6, N'AB010238', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (6, N'QB0102S', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (7, N'1S5002', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (7, N'1S5103', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (7, N'DN0301', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (8, N'A060336', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (8, N'A070636', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (8, N'Q0501M', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (9, N'S020236', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (9, N'S010238', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (9, N'Q0504L', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (10, N'1S5003', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (10, N'1S5101', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (11, N'DN0504', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (12, N'QB0202M', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (13, N'DN0404', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (14, N'1S5004', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (14, N'1S5105', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (15, N'S0402', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'S0502', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'A070636', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'Q0501M', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'S020236', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'S010238', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'Q0504L', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'1S5003', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'1S5101', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'DN0504', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'QB0202M', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'DN0404', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'1S5004', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'1S5105', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (16, N'S0402', 1, 10000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (17, N'A070436', 1, 139000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (17, N'A080338', 1, 149000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (17, N'DN0301', 1, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (17, N'Q0601L', 1, 70000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (17, N'Q0604M', 1, 70000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (19, N'1S5108', 5, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (19, N'A030336', 5, 119000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (19, N'DN0304', 5, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (20, N'AB010138', 10, 95000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (20, N'QB0102L', 10, 50000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (20, N'QB0203L', 10, 16000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (21, N'QB0201L', 10, 16000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (22, N'DN0304', 3, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (22, N'DN0301', 3, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (22, N'DN0303', 3, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (22, N'DN0302', 3, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (18, N'S020336', 6, 209000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (18, N'A080236', 6, 149000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (18, N'DN0304', 6, 449000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (18, N'Q0303M', 6, 59000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (23, N'1S5102', 8, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (23, N'1S5105', 8, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (23, N'1S5108', 8, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (24, N'1S5103', 2, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (24, N'1S5102', 4, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (24, N'1S5108', 4, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (24, N'1S5106', 2, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (25, N'1S5108', 1, 320000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (25, N'A010438', 1, 149000.0000, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductDetailID], [quantity], [price], [discount]) VALUES (26, N'A020138', 11, 129000.0000, NULL)
GO
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5001', N'1S50', 8, 1, 14)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5002', N'1S50', 8, 2, 53)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5003', N'1S50', 8, 3, 19)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5004', N'1S50', 9, 1, 7)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5005', N'1S50', 9, 2, 45)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5006', N'1S50', 9, 3, 14)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5101', N'1S51', 9, 1, 8)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5102', N'1S51', 9, 2, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5103', N'1S51', 9, 3, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5104', N'1S51', 10, 1, 2)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5105', N'1S51', 10, 2, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5106', N'1S51', 10, 3, 14)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5107', N'1S51', 8, 1, 0)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5108', N'1S51', 8, 2, 23)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'1S5109', N'1S51', 8, 3, 5)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010134', N'A01', 12, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010136', N'A01', 12, 6, 22)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010138', N'A01', 12, 7, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010234', N'A01', 8, 5, 22)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010236', N'A01', 8, 6, 27)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010238', N'A01', 8, 7, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010334', N'A01', 3, 5, 27)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010336', N'A01', 3, 6, 56)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010338', N'A01', 3, 7, 44)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010434', N'A01', 5, 5, 21)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010436', N'A01', 5, 6, 28)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010438', N'A01', 5, 7, 19)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010534', N'A01', 13, 5, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010536', N'A01', 13, 6, 41)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A010538', N'A01', 13, 7, 35)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020134', N'A02', 4, 5, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020136', N'A02', 4, 6, 41)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020138', N'A02', 4, 7, 35)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020234', N'A02', 8, 5, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020236', N'A02', 8, 6, 13)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020238', N'A02', 8, 7, 53)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020334', N'A02', 1, 5, 31)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020336', N'A02', 1, 6, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A020338', N'A02', 1, 7, 21)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030134', N'A03', 12, 5, 31)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030136', N'A03', 12, 6, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030138', N'A03', 12, 7, 21)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030234', N'A03', 4, 5, 33)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030236', N'A03', 4, 6, 29)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030238', N'A03', 4, 7, 31)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030334', N'A03', 8, 5, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030336', N'A03', 8, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A030338', N'A03', 8, 7, 36)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060134', N'A06', 1, 5, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060136', N'A06', 1, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060138', N'A06', 1, 7, 36)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060234', N'A06', 12, 5, 32)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060236', N'A06', 12, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060238', N'A06', 12, 7, 36)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060334', N'A06', 10, 5, 21)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060336', N'A06', 10, 6, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A060338', N'A06', 10, 7, 14)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070434', N'A07', 8, 5, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070436', N'A07', 8, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070438', N'A07', 8, 7, 29)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070534', N'A07', 5, 5, 30)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070536', N'A07', 5, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070538', N'A07', 5, 7, 31)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070634', N'A07', 10, 5, 30)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070636', N'A07', 10, 6, 34)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070638', N'A07', 10, 7, 31)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070734', N'A07', 14, 5, 50)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070736', N'A07', 14, 6, 54)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A070738', N'A07', 14, 7, 52)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080134', N'A08', 9, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080136', N'A08', 9, 6, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080138', N'A08', 9, 7, 22)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080234', N'A08', 13, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080236', N'A08', 13, 6, 19)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080238', N'A08', 13, 7, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080334', N'A08', 10, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080336', N'A08', 10, 6, 19)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'A080338', N'A08', 10, 7, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010134', N'AB01', 14, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010136', N'AB01', 14, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010138', N'AB01', 14, 7, 22)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010234', N'AB01', 5, 5, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010236', N'AB01', 5, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010238', N'AB01', 5, 7, 22)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010334', N'AB01', 12, 5, 17)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010336', N'AB01', 12, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'AB010338', N'AB01', 12, 7, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0301', N'DN03', 9, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0302', N'DN03', 10, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0303', N'DN03', 7, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0304', N'DN03', 8, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0401', N'DN04', 8, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0402', N'DN04', 5, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0403', N'DN04', 7, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0404', N'DN04', 9, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0405', N'DN04', 10, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0501', N'DN05', 10, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0502', N'DN05', 7, 9, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0503', N'DN05', 8, 9, 25)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'DN0504', N'DN05', 9, 9, 20)
GO
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0301L', N'Q03', 1, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0301M', N'Q03', 1, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0301S', N'Q03', 1, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0301XL', N'Q03', 1, 4, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0302L', N'Q03', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0302M', N'Q03', 10, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0302S', N'Q03', 10, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0302XL', N'Q03', 10, 4, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0303L', N'Q03', 8, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0303M', N'Q03', 8, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0303S', N'Q03', 8, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0303XL', N'Q03', 8, 4, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0304L', N'Q03', 9, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0304M', N'Q03', 9, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0304S', N'Q03', 9, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0304XL', N'Q03', 9, 4, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0305L', N'Q03', 12, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0305M', N'Q03', 12, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0305S', N'Q03', 12, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0305XL', N'Q03', 12, 4, 0)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0401L', N'Q04', 9, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0401M', N'Q04', 9, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0401S', N'Q04', 9, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0401XL', N'Q04', 9, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0402L', N'Q04', 8, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0402M', N'Q04', 8, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0402S', N'Q04', 8, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0402XL', N'Q04', 8, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0501L', N'Q05', 1, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0501M', N'Q05', 1, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0501S', N'Q05', 1, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0501XL', N'Q05', 1, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0502L', N'Q05', 8, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0502M', N'Q05', 8, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0502S', N'Q05', 8, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0502XL', N'Q05', 8, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0503L', N'Q05', 12, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0503M', N'Q05', 12, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0503S', N'Q05', 12, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0503XL', N'Q05', 12, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0504L', N'Q05', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0504M', N'Q05', 10, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0504S', N'Q05', 10, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0504XL', N'Q05', 10, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0601L', N'Q06', 8, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0601M', N'Q06', 8, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0601S', N'Q06', 8, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0601XL', N'Q06', 8, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0602L', N'Q06', 7, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0602M', N'Q06', 7, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0602S', N'Q06', 7, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0602XL', N'Q06', 7, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0603L', N'Q06', 9, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0603M', N'Q06', 9, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0603S', N'Q06', 9, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0603XL', N'Q06', 9, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0604L', N'Q06', 12, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0604M', N'Q06', 12, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0604S', N'Q06', 12, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'Q0604XL', N'Q06', 12, 4, 18)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0101L', N'QB01', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0101M', N'QB01', 10, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0101S', N'QB01', 10, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0101XL', N'QB01', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0102L', N'QB01', 7, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0102M', N'QB01', 7, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0102S', N'QB01', 7, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0102XL', N'QB01', 7, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0103L', N'QB01', 5, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0103M', N'QB01', 5, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0103S', N'QB01', 5, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0103XL', N'QB01', 5, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0201L', N'QB02', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0201M', N'QB02', 10, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0201S', N'QB02', 10, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0201XL', N'QB02', 10, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0202L', N'QB02', 2, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0202M', N'QB02', 2, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0202S', N'QB02', 2, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0202XL', N'QB02', 2, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0203L', N'QB02', 14, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0203M', N'QB02', 14, 2, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0203S', N'QB02', 14, 1, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'QB0203XL', N'QB02', 14, 3, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010134', N'S01', 5, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010136', N'S01', 5, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010138', N'S01', 5, 7, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010234', N'S01', 14, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010236', N'S01', 14, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010238', N'S01', 14, 7, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010334', N'S01', 1, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010336', N'S01', 1, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010338', N'S01', 1, 7, 24)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010434', N'S01', 8, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010436', N'S01', 8, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S010438', N'S01', 8, 7, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020134', N'S02', 1, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020136', N'S02', 1, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020138', N'S02', 1, 7, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020234', N'S02', 9, 5, 20)
GO
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020236', N'S02', 9, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020238', N'S02', 9, 7, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020334', N'S02', 8, 5, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020336', N'S02', 8, 6, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S020338', N'S02', 8, 7, 2)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S0401', N'S04', 6, 9, 20)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S0402', N'S04', 10, 9, 12)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S0501', N'S05', 1, 9, 30)
INSERT [dbo].[ProductDetail] ([ProductDetailID], [ProductID], [colorID], [sizeID], [UnitInStock]) VALUES (N'S0502', N'S05', 8, 9, 25)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'1S50', N'Bộ đồ lót hóa trang mèo dễ thương quyến rũ', N'1S', N'SD', 269000, N'cotton', CAST(N'2020-10-23' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'1S51', N'Bộ đồ lót hóa trang thỏ bông dễ thương quyến rũ ', N'1S', NULL, 320000, N'Nylon', CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A01', N'Áo lót không gọng Nhật Bản chống ung thư', N'AL', N'KG', 149000, N'cotton', CAST(N'2021-10-10' AS Date), N'Áo Lót không Gọng đệm mỏng 2,5cm. Nâng đỡ tự nhiên. Đệm áo ôm trọn bầu ngực, tạo khe nâng đỡ tự nhiên cho mọi dáng ngực. Áo thiết kế không gọng thoải mái, quai áo cotton bản to sẽ KHÔNG LỘ MỠ THỪA VÒNG LƯNG. Chất liệt vải cotton cao cấp mềm mại, thoải mái và thoáng khí, không hằn da. Mút Cotton thấm hút mồ hôi.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A02', N'Áo lót không gọng ren hoa', N'AL', N'AR', 129000, N'cotton', CAST(N'2021-10-11' AS Date), N'Áo Lót không gọng, đệm mỏng 2,5cm. Nâng đỡ tự nhiên, ôm trọn bầu ngực, tạo khe quyến rũ. Chất liệt vải cotton cao cấp mềm mại, thoải mái và thoáng khí, không hằn da. Mút Cotton thấm hút mồ hôi. Họa tiết ren hoa quyến rũ.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A03', N'Áo quây ngực cài trước', N'AL', N'KD', 119000, N'cotton poly', CAST(N'2021-10-08' AS Date), N'Áo quây ngực đệm 02 cm. Nâng đỡ tự nhiên, ôm trọn bầu ngực, siêu tạo khe, siêu quyến rũ. Mắc cài phía trước dễ điều chỉnh và sử dụng. Chất liệt vải cotton cao cấp mềm mại, thoải mái và thoáng khí, không hằn da. Mút Cotton thấm hút mồ hôi.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A06', N'Áo lót quả xoài cài quai trước', N'AL', N'CT', 149000, N'cotton', CAST(N'2021-09-08' AS Date), N'Áo lót siêu xinh, quai cài trước cá tính, tiện dụng, đệm dày 03cm, nâng đỡ nhẹ nhàng, ôm trọn vòng một, tạo khe quyến rũ, màu sắc trẻ trung.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A07', N'Áo lót su đúc trơn', N'AL', N'KV', 139000, N'su đúc', CAST(N'2021-09-18' AS Date), N'Áo lót nữ với kiểu dáng dạng trơn đơn giản, áo lót nữ dạng đúc, không đường may tinh tế, chắc chắn, mang đến vẻ thời trang, sang trọng, tạo đường cong hai bên eo giúp vòng 1 tròn đầy, quyến rũ. Áo không gọng, không đệm mút mỏng giúp nâng đỡ núi đôi được thon gọn, săn chắc, cho bạn luôn cảm thấy tự tin trong sinh hoạt hằng ngày. Thiết kế ôm trọn bầu ngực nâng đỡ hoàn hảo chống ung thư. Thiết kế xẻ sâu và rộng, chị em bầu bí rất tiện cho bé tuti. Chất liệu Su mềm mại, nhẹ nhàng, thông thoáng, co giãn tốt, mang lại cảm giác thoải mái khi mặc. Đặc biệt CÓ THỂ GIẶT MÁY GIẶT thoải mái KHÔNG lo bị mất form dáng.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'A08', N'Áo lót su non không viền', N'AL', N'KV', 149000, N'su đúc', CAST(N'2021-09-12' AS Date), N'Áo lót không viền may, không lộ, đệm dày 2,5cm, nâng đẩy nhẹ nhàng. Chất liệu su non thoáng mát, phù hợp với ngày giao mùa và thời tiết mùa hè, tạo cảm giác êm ái, nhẹ nhàng.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'AB01', N'Áo lót bầu không gọng vải su mát', N'BB', NULL, 95000, N'su', CAST(N'2021-09-17' AS Date), N'Không gọng, không hằn, giữ form chuẩn. Chất su non mềm mịn co dãn tốt, siêu thoải mái. Đệm mỏng, thoáng, thấm hút cực tốt. Áo có khuy cài dễ dàng đóng mở cho bé tuti vô cùng tiện lợi.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'DN03', N'Váy ngủ lụa cao cấp quyến rũ', N'DN', NULL, 449000, N'lụa', CAST(N'2021-09-15' AS Date), N'Váy ngủ viền ren, chất liệu lụa cao cấp, cực mềm, mịn, mát, thoáng. Áo khoác lụa phối ren cùng màu. Kiểu dáng nhã nhặn, sang trọng, quyến rũ. Freesize dưới 65kg.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'DN04', N'Bộ ngủ hai dây', N'DN', NULL, 249000, N'lụa', CAST(N'2021-09-21' AS Date), N'Bộ ngủ lụa cao cấp, áo hai dây họa tiết hoa bản lớn sang trọng, chất liệu lụa cao cấp, mềm, mịn, thoáng mát. Freesize dưới 65kg.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'DN05', N'Bộ ngủ lụa họa tiết bò sữa', N'DN', NULL, 239000, N'lụa', CAST(N'2021-09-18' AS Date), N'Bộ ngủ lụa hai dây, chất liệu lụa cao cấp, sang trọng, mềm, mịn, thoáng mát. Freesize dưới 65kg.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'Q03', N'Quần cạp trơn không viền gen bụng', N'QL', N'GB', 59000, N'su đúc', CAST(N'2021-10-14' AS Date), N'Thoải mái trong thiết kế quần không viền từ chất su đúc mát lạnh và khả năng gen bụng cho vòng 2 thon gọn như ý. Lớp lót cotton thấm hút, an toàn. Vải mềm, mướt mát. Chiếc quần cho eo thon và nâng mông nhẹ, khắc phục các nhược điểm cơ thể.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'Q04', N'Quần gen bụng tàng hình', N'QL', N'GB', 85000, N'cotton', CAST(N'2021-10-01' AS Date), N'Quần gen bụng tàng hình invisible. Tạm biệt mỡ bụng. Chất liệu mềm mịn, thoáng khí. Công nghệ không đường viền, êm phẳng, không hằn. Cạp cao, có 4 thanh silicon quanh cạp chống gập cuộn. 2 màu: đen, trắng.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'Q05', N'Quần lót ren lọt khe', N'QL', N'LK', 75000, N'cotton', CAST(N'2021-09-20' AS Date), N'Siêu phẩm Quần lót lọt khe ren. Với chất liệu ren mịn được nhập khẩu từ nước ngoài có độ bền cao cùng với hoa văn quyến rũ, thời thượng, thỏa mãn nhu cầu mua hàng “đẹp – không đụng hàng” của các chị em phụ nữ. Lớp Cotton kháng khuẩn ở mặt đáy giúp cân bằng độ ẩm, khử khuẩn và khử mùi cực tốt. Dây lưng được làm từ thun co dãn mỏng nhẹ ôm sát cơ thể giúp bạn thoải mái diện những thiết kế ôm body mà không để lại vết hằn lên trang phục.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'Q06', N'Quần lót lọt khe siêu mỏng', N'QL', N'LK', 70000, N'su', CAST(N'2021-09-24' AS Date), N'Quần lọt khe cho mùa hè quyến rũ. Chất su mềm mịn, thoải mái vận động mà không bị gò bó. Co giãn 4 chiều, thấm hút mồ hôi. Chìm viền, thoải mái mặc đồ body không lo lộ viền. Chuẩn form, ôm dáng nuột nà, tôn V3 chuẩn nét.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'QB01', N'Quần lót lụa sữa cho mẹ bầu', N'BB', N'QB', 50000, N'cotton', CAST(N'2021-09-20' AS Date), N'Quần lót bầu chuyên dụng cho mùa hè. Chất liệu su mát lạnh, co giãn 4 chiều, siêu thoáng khí và thoải mái. Cạp dính tinh tế, chất liệu mềm mại, không lo bị hằn.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'QB02', N'Set quần lót bầu kháng khuẩn', N'BB', N'QB', 16000, N'cotton', CAST(N'2021-09-20' AS Date), N'Set gồm 04 quần lót kháng khuẩn cho mẹ bầu. Công nghệ kháng khuẩn giúp bảo vệ vùng kín và phòng ngừa bệnh phụ khoa. Chất cotton thoải mái, mịn, mát. Màu sắc patel nhẹ nhàng, họa tiết dễ thương.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'S01', N'Set đồ lót ren hoa', N'1S', N'SR', 219000, N'cotton', CAST(N'2021-09-18' AS Date), N'Set đồ lót ren hoa quyến rũ. Thiết kế ren độc đáo. Áo đệm nâng đẩy nhẹ nhàng, tạo khe quyến rũ. Quần lót ôm sát cơ thể, tạo đường cong gợi cảm.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'S02', N'Set đồ lót phối ren áo không gọng', N'1S', N'SR', 209000, N'cotton', CAST(N'2021-09-15' AS Date), N'Set đồ lót phối viền ren quyến rũ. Áo đệm 03cm nâng đẩy nhẹ nhàng, tạo khe ngực. Quần lót ôm sát cơ thể, tạo đường cong gợi cảm. Chất liệu cotton mềm mịn, thoáng, thấm hút mồ hôi.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'S04', N'Set đồ lót cotton cột dây cute', N'1S', N'SD', 245000, N'cotton', CAST(N'2021-09-12' AS Date), N'Bộ đồ lót cột dây họa tiết màu sắc cute đáng yêu cho nàng thêm cá tính đáng yêu trước mắt chàng. Màu: hồng, xanh. Freesize.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatID], [SubCatID], [Price], [Material], [AddDate], [describe]) VALUES (N'S05', N'Set đồ lót ren cột dây', N'1S', N'SD', 215000, N'cotton', CAST(N'2021-09-18' AS Date), N'Bộ đồ lót cột dây họa tiết ren cho nàng sexy. Màu: đỏ, đen. Freesize.')
GO
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Vũ Phong', CAST(N'2001-04-14' AS Date), N'0123456789', N'Hà Nội', N'duke')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Kiều Thắm', CAST(N'2021-09-12' AS Date), N'0123456789', N'Lai Châu', N'Jun')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Tiến Anh', CAST(N'2001-09-09' AS Date), N'0123456789', N'Đại học FPT', N'ta')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Lương Anh', CAST(N'2001-09-09' AS Date), N'0123456789', N'Hà Nội', N'mrtat')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Anh Tiến Lương', CAST(N'2001-09-09' AS Date), N'0123456789', N'Hà Đông, Hà Nội', N'lta')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Đăng Bá', CAST(N'2001-05-19' AS Date), N'0123456789', N'Bắc Ninh', N'busn')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Ngô Phươn', CAST(N'2001-01-01' AS Date), N'0123456789', N'Hòa Bình', N'phuon')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Trung Tom', CAST(N'2001-01-12' AS Date), N'0123456789', N'Hai Bà Trưng', N'trung')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Phong Tuấn Vũ', CAST(N'2001-04-14' AS Date), N'0123456789', N'Chiến Thắng, Hà Nội', N'phong')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Đức Trung', CAST(N'2001-01-12' AS Date), N'0123456789', N'Hà Nội', N'tom')
INSERT [dbo].[Profile] ([Name], [Dob], [PhoneNumber], [Address], [username]) VALUES (N'Luong Tien Anh', CAST(N'2001-09-09' AS Date), N'0522909921', N'hoa lac ha noi', N'qwertty')
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (1, N'S')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (2, N'M')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (3, N'L')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (5, N'34')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (6, N'36')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (7, N'38')
INSERT [dbo].[Size] ([SizeID], [SizeName]) VALUES (9, N'Freesize')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'AB', N'BB', N'Áo bầu')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'AR', N'AL', N'Ren')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'CG', N'AL', N'Có gọng')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'CT', N'AL', N'Cài trước')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'GB', N'QL', N'Gen bụng')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'KD', N'AL', N'Không dây')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'KG', N'AL', N'Không gọng')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'KV', N'AL', N'Không Viền')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'LK', N'QL', N'Lọt khe')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'QB', N'BB', N'Quần bầu')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'QD', N'QL', N'Dây')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'QR', N'QL', N'Ren')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'SD', N'1S', N'Dây')
INSERT [dbo].[SubCategories] ([SubCatID], [CatID], [SubCatName]) VALUES (N'SR', N'1S', N'Ren')
GO
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'ad', N'123', 3)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'busn', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'duke', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'Jun', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'lta', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'mrtat', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'phong', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'phuon', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'qwertty', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'rt', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'ta', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'tom', N'123', 1)
INSERT [dbo].[User] ([username], [password], [role]) VALUES (N'trung', N'123', 1)
GO
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phuon', N'S02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phuon', N'DN03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'busn', N'DN03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'busn', N'1S51')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'busn', N'A03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'duke', N'QB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'Jun', N'A01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'1S51')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'A03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'A08')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'S04')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'DN03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'AB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'DN05')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'QB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'ta', N'S02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'A07')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'AB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'Q04')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'Q06')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'1S51')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'S02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'1S50')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'DN05')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'mrtat', N'DN03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phong', N'QB02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phong', N'QB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phong', N'AB01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'Q06')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'S04')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'S01')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'Q05')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'DN05')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'DN04')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'A08')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'A03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'1S50')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'lta', N'1S51')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phuon', N'A02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'duke', N'QB02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'phuon', N'Q03')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'qwertty', N'A02')
INSERT [dbo].[WishList] ([username], [ProductID]) VALUES (N'duke', N'AB01')
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[ProductDetail] ADD  DEFAULT ((0)) FOR [UnitInStock]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetail] ([ProductDetailID])
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetail] ([ProductDetailID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([colorID])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([sizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SubCatID])
REFERENCES [dbo].[SubCategories] ([SubCatID])
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
USE [master]
GO
ALTER DATABASE [ChopHouse] SET  READ_WRITE 
GO
