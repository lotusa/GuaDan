USE [master]
GO
/****** Object:  Database [HotelManage]    Script Date: 01/16/2018 18:17:44 ******/
CREATE DATABASE [HotelManage] ON  PRIMARY 
( NAME = N'HotelManage', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\HotelManage.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelManage_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\HotelManage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelManage] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManage] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HotelManage] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HotelManage] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HotelManage] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HotelManage] SET ARITHABORT OFF
GO
ALTER DATABASE [HotelManage] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HotelManage] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HotelManage] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HotelManage] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HotelManage] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HotelManage] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HotelManage] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HotelManage] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HotelManage] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HotelManage] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HotelManage] SET  DISABLE_BROKER
GO
ALTER DATABASE [HotelManage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HotelManage] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HotelManage] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HotelManage] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HotelManage] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HotelManage] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HotelManage] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HotelManage] SET  READ_WRITE
GO
ALTER DATABASE [HotelManage] SET RECOVERY SIMPLE
GO
ALTER DATABASE [HotelManage] SET  MULTI_USER
GO
ALTER DATABASE [HotelManage] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HotelManage] SET DB_CHAINING OFF
GO
USE [HotelManage]
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[G_Id] [int] IDENTITY(1,1) NOT NULL,
	[G_Name] [nchar](10) NOT NULL,
	[G_Gender] [bit] NOT NULL,
	[G_Tel] [nchar](20) NULL,
	[G_IdCard] [nchar](20) NULL,
	[G_Age] [smallint] NULL,
	[G_Comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Guests] PRIMARY KEY CLUSTERED 
(
	[G_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[U_Id] [int] IDENTITY(1,1) NOT NULL,
	[U_Name] [nvarchar](50) NOT NULL,
	[U_Pwd] [nvarchar](50) NOT NULL,
	[U_RealName] [nvarchar](50) NULL,
	[U_Sex] [nvarchar](50) NULL,
	[U_Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[U_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[Rt_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rt_Name] [nvarchar](50) NOT NULL,
	[Rt_Price] [decimal](18, 2) NULL,
	[Rt_Note] [ntext] NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[Rt_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[R_Id] [int] IDENTITY(1,1) NOT NULL,
	[R_No] [nvarchar](50) NOT NULL,
	[R_Tel] [nvarchar](50) NULL,
	[R_State] [nvarchar](50) NOT NULL,
	[Rt_Id] [int] NOT NULL,
	[R_Beds] [int] NOT NULL,
	[R_EmptyBeds] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[R_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空，入住，关房' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'R_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'床位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'R_Beds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空床数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'R_EmptyBeds'
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[O_Id] [int] IDENTITY(1,1) NOT NULL,
	[O_No] [nvarchar](50) NULL,
	[O_Name] [nvarchar](50) NULL,
	[O_Tel] [nvarchar](50) NULL,
	[O_Time] [datetime] NULL,
	[O_Budget] [datetime] NULL,
	[Rt_Id] [int] NULL,
	[U_Id] [int] NULL,
	[O_State] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[O_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户预订ID（PK）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_No'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下单时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预入住日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_Budget'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（未入住，已入住）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'O_State'
GO
/****** Object:  Table [dbo].[Live]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Live](
	[L_Id] [int] IDENTITY(1,1) NOT NULL,
	[L_No] [nvarchar](50) NULL,
	[L_Name] [nvarchar](50) NOT NULL,
	[L_Gender] [nchar](10) NULL,
	[L_Age] [nchar](10) NULL,
	[L_IdCard] [nvarchar](50) NULL,
	[L_Tel] [nvarchar](50) NULL,
	[L_Time] [datetime] NOT NULL,
	[L_OutTime] [datetime] NULL,
	[L_Deposit] [decimal](18, 2) NULL,
	[R_Id] [int] NULL,
	[L_Pay] [decimal](18, 2) NULL,
	[L_Total] [decimal](18, 2) NULL,
	[L_State] [nvarchar](50) NOT NULL,
	[U_Id] [int] NULL,
	[L_Comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Live] PRIMARY KEY CLUSTERED 
(
	[L_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入住时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'L_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退房时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'L_OutTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入住定金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'L_Deposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入住编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'R_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（未结算，已结算）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'L_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Live', @level2type=N'COLUMN',@level2name=N'L_Comment'
GO
/****** Object:  Table [dbo].[Consumption]    Script Date: 01/16/2018 18:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumption](
	[C_Id] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [nvarchar](50) NULL,
	[C_Price] [decimal](18, 2) NULL,
	[C_Time] [datetime] NULL,
	[L_Id] [int] NULL,
	[U_Id] [int] NULL,
 CONSTRAINT [PK_Consumption] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Guests_G_Sex]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Guests] ADD  CONSTRAINT [DF_Guests_G_Sex]  DEFAULT ((1)) FOR [G_Gender]
GO
/****** Object:  Default [DF_Room_R_State]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_R_State]  DEFAULT (N'空') FOR [R_State]
GO
/****** Object:  Default [DF_Room_R_Beds]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_R_Beds]  DEFAULT ((1)) FOR [R_Beds]
GO
/****** Object:  Default [DF_Room_R_EmptyBeds]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_R_EmptyBeds]  DEFAULT ((1)) FOR [R_EmptyBeds]
GO
/****** Object:  Default [DF_Live_L_Gender]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Live] ADD  CONSTRAINT [DF_Live_L_Gender]  DEFAULT ((1)) FOR [L_Gender]
GO
/****** Object:  ForeignKey [FK_Room_RoomType]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([Rt_Id])
REFERENCES [dbo].[RoomType] ([Rt_Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
/****** Object:  ForeignKey [FK_Orders_RoomType]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_RoomType] FOREIGN KEY([Rt_Id])
REFERENCES [dbo].[RoomType] ([Rt_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_RoomType]
GO
/****** Object:  ForeignKey [FK_Live_Room]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Live]  WITH CHECK ADD  CONSTRAINT [FK_Live_Room] FOREIGN KEY([R_Id])
REFERENCES [dbo].[Room] ([R_Id])
GO
ALTER TABLE [dbo].[Live] CHECK CONSTRAINT [FK_Live_Room]
GO
/****** Object:  ForeignKey [FK_Consumption_Consumption]    Script Date: 01/16/2018 18:17:45 ******/
ALTER TABLE [dbo].[Consumption]  WITH CHECK ADD  CONSTRAINT [FK_Consumption_Consumption] FOREIGN KEY([L_Id])
REFERENCES [dbo].[Live] ([L_Id])
GO
ALTER TABLE [dbo].[Consumption] CHECK CONSTRAINT [FK_Consumption_Consumption]
GO
