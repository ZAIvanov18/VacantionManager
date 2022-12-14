USE [master]
GO
/****** Object:  Database [VacationManager]    Script Date: 11/19/2022 1:11:02 PM ******/
CREATE DATABASE [VacationManager]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'VacationManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'VacationManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VacationManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacationManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacationManager] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [VacationManager] SET ANSI_NULLS OFF
GO
ALTER DATABASE [VacationManager] SET ANSI_PADDING OFF
GO
ALTER DATABASE [VacationManager] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [VacationManager] SET ARITHABORT OFF
GO
ALTER DATABASE [VacationManager] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [VacationManager] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [VacationManager] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [VacationManager] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [VacationManager] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [VacationManager] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [VacationManager] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [VacationManager] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [VacationManager] SET  DISABLE_BROKER
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [VacationManager] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [VacationManager] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [VacationManager] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [VacationManager] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [VacationManager] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [VacationManager] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [VacationManager] SET RECOVERY SIMPLE
GO
ALTER DATABASE [VacationManager] SET  MULTI_USER
GO
ALTER DATABASE [VacationManager] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [VacationManager] SET DB_CHAINING OFF
GO
ALTER DATABASE [VacationManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [VacationManager] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [VacationManager] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [VacationManager] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [VacationManager] SET QUERY_STORE = OFF
GO
USE [VacationManager]
GO
/****** Object:  User [testche]    Script Date: 11/19/2022 1:11:03 PM ******/
CREATE USER [testche] FOR LOGIN [standartUser] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [testche]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [testche]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [testche]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [testche]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [testche]
GO
ALTER ROLE [db_datareader] ADD MEMBER [testche]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [testche]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [testche]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [testche]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11/19/2022 1:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ProjectName] [nvarchar](255) NOT NULL,
    [Description] [ntext] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/19/2022 1:11:03 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Roles](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [RoleName] [varchar](100) NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/19/2022 1:11:03 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Teams](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [TeamName] [nvarchar](255) NOT NULL,
    [ProjectId] [int] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/19/2022 1:11:03 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Users](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Username] [varchar](255) NOT NULL,
    [Password] [varbinary](max) NOT NULL,
    [FirstName] [nvarchar](255) NOT NULL,
    [LastName] [nvarchar](255) NOT NULL,
    [RoleID] [int] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 11/19/2022 1:11:03 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[UsersTeams](
    [TeamId] [int] NOT NULL,
    [UserId] [int] NOT NULL,
    [IsLeader] [bit] NOT NULL,
     PRIMARY KEY CLUSTERED
    (
    [TeamId] ASC,
[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Vacations]    Script Date: 11/19/2022 1:11:03 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Vacations](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [DateFrom] [date] NOT NULL,
    [DateTo] [date] NOT NULL,
    [DateCreated] [datetime2](7) NOT NULL,
    [IsHalfDay] [bit] NOT NULL,
    [IsApproved] [bit] NOT NULL,
    [UserID] [int] NOT NULL,
    [SickSheet] [image] NOT NULL,
    [IsHospitalized] [bit] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams.ProjectId] FOREIGN KEY([ProjectId])
    REFERENCES [dbo].[Projects] ([Id])
    GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams.ProjectId]
    GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users.RoleID] FOREIGN KEY([RoleID])
    REFERENCES [dbo].[Roles] ([Id])
    GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users.RoleID]
    GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams.TeamId] FOREIGN KEY([TeamId])
    REFERENCES [dbo].[Teams] ([Id])
    GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams.TeamId]
    GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams.UserId] FOREIGN KEY([UserId])
    REFERENCES [dbo].[Users] ([Id])
    GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams.UserId]
    GO
ALTER TABLE [dbo].[Vacations]  WITH CHECK ADD  CONSTRAINT [FK_Vacations.UserID] FOREIGN KEY([UserID])
    REFERENCES [dbo].[Users] ([Id])
    GO
ALTER TABLE [dbo].[Vacations] CHECK CONSTRAINT [FK_Vacations.UserID]
    GO
    USE [master]
    GO
ALTER DATABASE [VacationManager] SET  READ_WRITE
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER TRIGGER HashPassword
ON [dbo].[Users]
INSTEAD OF INSERT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Users(Username,[Password],FirstName,LastName,RoleID)
SELECT
    i.Username,
    CONVERT(varbinary(max),EncryptByPassPhrase('cat_on_keyboard',i.[Password]),2) ,
    i.FirstName,
    i.LastName,
    i.RoleID
FROM inserted AS i
END