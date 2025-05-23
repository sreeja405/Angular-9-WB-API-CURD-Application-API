USE [master]
GO
/****** Object:  Database [WebApiDb]    Script Date: 2/16/2020 4:17:23 AM ******/
CREATE DATABASE [WebApiDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApiDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebApiDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebApiDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebApiDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebApiDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApiDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApiDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApiDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApiDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApiDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApiDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApiDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApiDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApiDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApiDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApiDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApiDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApiDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApiDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApiDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApiDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebApiDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApiDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApiDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApiDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApiDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApiDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebApiDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApiDb] SET RECOVERY FULL 
GO
ALTER DATABASE [WebApiDb] SET  MULTI_USER 
GO
ALTER DATABASE [WebApiDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApiDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApiDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApiDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApiDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebApiDb] SET QUERY_STORE = OFF
GO
USE [WebApiDb]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/16/2020 4:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/16/2020 4:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](150) NULL,
	[DepartmentID] [int] NULL,
	[RecordStatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordStatus]    Script Date: 2/16/2020 4:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordStatus](
	[RecordStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RecordStatusName] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewEmployeeDetails]    Script Date: 2/16/2020 4:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewEmployeeDetails]
AS
SELECT        dbo.Employee.EmployeeID, dbo.Employee.EmployeeName, dbo.Employee.DepartmentID, dbo.Department.DepartmentName, dbo.Employee.RecordStatusID, dbo.RecordStatus.RecordStatusName
FROM            dbo.Employee INNER JOIN
                         dbo.Department ON dbo.Employee.DepartmentID = dbo.Department.DepartmentID INNER JOIN
                         dbo.RecordStatus ON dbo.Employee.RecordStatusID = dbo.RecordStatus.RecordStatusID
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (1, N'Software Development', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (2, N'Software Testing', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (3, N'Project Team', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (4, N'Mobile Development', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (5, N'Mobile Testing', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (6, N'IT Department', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (7, N'Support', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (8, N'Finance', 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Active]) VALUES (9, N'Service Team', 1)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (1, N'Shelock', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (2, N'Kevin', 2, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (3, N'John', 3, 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (4, N'Stephen', 8, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (5, N'Sherin', 9, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [DepartmentID], [RecordStatusID]) VALUES (6, N'Merlin', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[RecordStatus] ON 
GO
INSERT [dbo].[RecordStatus] ([RecordStatusID], [RecordStatusName]) VALUES (1, N'Active')
GO
INSERT [dbo].[RecordStatus] ([RecordStatusID], [RecordStatusName]) VALUES (2, N'Inactive')
GO
SET IDENTITY_INSERT [dbo].[RecordStatus] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 119
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RecordStatus"
            Begin Extent = 
               Top = 120
               Left = 249
               Bottom = 216
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEmployeeDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEmployeeDetails'
GO
USE [master]
GO
ALTER DATABASE [WebApiDb] SET  READ_WRITE 
GO
