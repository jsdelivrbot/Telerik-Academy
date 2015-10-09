USE [master]
GO
/****** Object:  Database [Persons]    Script Date: 9.10.2015 г. 23:19:44 ******/
CREATE DATABASE [Persons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Persons', FILENAME = N'G:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Persons.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Persons_log', FILENAME = N'G:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Persons_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Persons] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Persons].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Persons] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Persons] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Persons] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Persons] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Persons] SET ARITHABORT OFF 
GO
ALTER DATABASE [Persons] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Persons] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Persons] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Persons] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Persons] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Persons] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Persons] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Persons] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Persons] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Persons] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Persons] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Persons] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Persons] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Persons] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Persons] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Persons] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Persons] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Persons] SET RECOVERY FULL 
GO
ALTER DATABASE [Persons] SET  MULTI_USER 
GO
ALTER DATABASE [Persons] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Persons] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Persons] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Persons] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Persons] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Persons', N'ON'
GO
USE [Persons]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 9.10.2015 г. 23:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[id] [int] NOT NULL,
	[address_text] [varchar](50) NULL,
	[town_id] [int] NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 9.10.2015 г. 23:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 9.10.2015 г. 23:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 9.10.2015 г. 23:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON](
	[id] [int] NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 9.10.2015 г. 23:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TOWN](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (1, N'Bulgaria 20', 1)
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'az', N'az', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([town_id])
REFERENCES [dbo].[TOWN] ([id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([address_id])
REFERENCES [dbo].[ADDRESS] ([id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [Persons] SET  READ_WRITE 
GO
