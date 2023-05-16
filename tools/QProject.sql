USE [master]
GO
/****** Object:  Database [QProject]    Script Date: 2023/5/16 15:45:06 ******/
CREATE DATABASE [QProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [QProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QProject] SET  MULTI_USER 
GO
ALTER DATABASE [QProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [QProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QProject]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Content] [text] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileStore]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStore](
	[FCID] [varchar](100) NOT NULL,
	[Name] [varchar](100) NULL,
	[SuffixName] [varchar](100) NULL,
	[FilePath] [varchar](max) NULL,
	[FilePathByte] [varbinary](max) NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_FileStore] PRIMARY KEY CLUSTERED 
(
	[FCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectFileInfo]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectFileInfo](
	[FIID] [nvarchar](100) NOT NULL,
	[FCID] [nvarchar](100) NULL,
	[FlieName] [nvarchar](100) NULL,
	[UploadName] [nvarchar](100) NULL,
	[IdCardInform] [nvarchar](100) NULL,
	[Unit] [nvarchar](100) NULL,
	[CreateTime1] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ProjectFileInform] PRIMARY KEY CLUSTERED 
(
	[FIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectFileMean]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectFileMean](
	[FCID] [varchar](50) NOT NULL,
	[FatherNode] [varchar](50) NULL,
	[ListName] [varchar](256) NOT NULL,
	[ListMenuCode] [varchar](50) NOT NULL,
	[MenuLevel] [int] NULL,
	[CreateTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ProjectFileMean] PRIMARY KEY CLUSTERED 
(
	[FCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Birthday] [datetime] NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK__User__3214EC07687BC3C8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBlog]    Script Date: 2023/5/16 15:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[StarStarte] [int] NULL,
 CONSTRAINT [PK__UserBlog__3214EC07C7AD2AA9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[ProjectFileInfo] ADD  CONSTRAINT [DF_ProjectFileInfo_CreateTime1]  DEFAULT (getdate()) FOR [CreateTime1]
GO
ALTER TABLE [dbo].[ProjectFileInfo] ADD  CONSTRAINT [DF_ProjectFileInfo_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[ProjectFileMean] ADD  CONSTRAINT [DF_ProjectFileMean_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[ProjectFileMean] ADD  CONSTRAINT [DF_ProjectFileMean_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__CreatedTim__49C3F6B7]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([CreateUserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[UserBlog]  WITH CHECK ADD  CONSTRAINT [FK_UserBlog_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[UserBlog] CHECK CONSTRAINT [FK_UserBlog_Blog]
GO
ALTER TABLE [dbo].[UserBlog]  WITH CHECK ADD  CONSTRAINT [FK_UserBlog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserBlog] CHECK CONSTRAINT [FK_UserBlog_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'FCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'SuffixName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'FilePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件以byte格式存储' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'FilePathByte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除(1 存在； 2 不存在)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectFileInfo', @level2type=N'COLUMN',@level2name=N'FCID'
GO
USE [master]
GO
ALTER DATABASE [QProject] SET  READ_WRITE 
GO
