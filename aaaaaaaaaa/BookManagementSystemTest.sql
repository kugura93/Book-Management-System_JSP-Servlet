USE [master]
GO
/****** Object:  Database [BookManagementSystemTest]    Script Date: 4/13/2022 2:52:57 PM ******/
CREATE DATABASE [BookManagementSystemTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagementSystemTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookManagementSystemTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagementSystemTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookManagementSystemTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookManagementSystemTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagementSystemTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagementSystemTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookManagementSystemTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagementSystemTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagementSystemTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagementSystemTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagementSystemTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagementSystemTest] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagementSystemTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagementSystemTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagementSystemTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagementSystemTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagementSystemTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagementSystemTest] SET QUERY_STORE = OFF
GO
USE [BookManagementSystemTest]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[author_id] [nvarchar](50) NOT NULL,
	[author_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [nvarchar](50) NOT NULL,
	[book_title] [nvarchar](255) NOT NULL,
	[author_id] [nvarchar](50) NOT NULL,
	[brief] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[category_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCase]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCase](
	[book_case_id] [nvarchar](50) NOT NULL,
	[book_case_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookCase] PRIMARY KEY CLUSTERED 
(
	[book_case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [nvarchar](50) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contain]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contain](
	[book_case_id] [nvarchar](50) NOT NULL,
	[book_id] [nvarchar](50) NOT NULL,
	[create_date] [date] NOT NULL,
 CONSTRAINT [PK_Contain] PRIMARY KEY CLUSTERED 
(
	[book_case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[authority] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/13/2022 2:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Khaind', N'1111', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'A', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'ssss', N'111', 0, 0)
GO
INSERT [dbo].[Role] ([role_id], [authority]) VALUES (0, N'sell')
INSERT [dbo].[Role] ([role_id], [authority]) VALUES (1, N'admin')
GO
INSERT [dbo].[User] ([id], [user_name], [password], [role_id]) VALUES (N'1', N'khaind', N'11111', 1)
INSERT [dbo].[User] ([id], [user_name], [password], [role_id]) VALUES (N'2', N'namns', N'22222', 0)
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([author_id])
REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[BookCase]  WITH CHECK ADD  CONSTRAINT [FK_BookCase_User] FOREIGN KEY([book_case_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookCase] CHECK CONSTRAINT [FK_BookCase_User]
GO
ALTER TABLE [dbo].[Contain]  WITH CHECK ADD  CONSTRAINT [FK_Contain_Book] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Contain] CHECK CONSTRAINT [FK_Contain_Book]
GO
ALTER TABLE [dbo].[Contain]  WITH CHECK ADD  CONSTRAINT [FK_Contain_BookCase] FOREIGN KEY([book_case_id])
REFERENCES [dbo].[BookCase] ([book_case_id])
GO
ALTER TABLE [dbo].[Contain] CHECK CONSTRAINT [FK_Contain_BookCase]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [BookManagementSystemTest] SET  READ_WRITE 
GO
