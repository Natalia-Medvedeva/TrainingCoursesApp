USE [master]
GO
/****** Object:  Database [TrainingCourses]    Script Date: 29.04.2022 14:20:37 ******/
CREATE DATABASE [TrainingCourses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrainingCourses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TrainingCourses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrainingCourses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TrainingCourses_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TrainingCourses] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrainingCourses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrainingCourses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrainingCourses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrainingCourses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrainingCourses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrainingCourses] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrainingCourses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrainingCourses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrainingCourses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrainingCourses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrainingCourses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrainingCourses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrainingCourses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrainingCourses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrainingCourses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrainingCourses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrainingCourses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrainingCourses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrainingCourses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrainingCourses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrainingCourses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrainingCourses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrainingCourses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrainingCourses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrainingCourses] SET  MULTI_USER 
GO
ALTER DATABASE [TrainingCourses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrainingCourses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrainingCourses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrainingCourses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrainingCourses] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrainingCourses] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TrainingCourses] SET QUERY_STORE = OFF
GO
USE [TrainingCourses]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Program] [nvarchar](max) NOT NULL,
	[IDOrganization] [int] NOT NULL,
	[PlanStart] [date] NOT NULL,
	[PlanEnd] [date] NOT NULL,
	[CountHours] [int] NULL,
	[CountPeopleMax] [int] NULL,
	[CountPeopleNow] [int] NULL,
	[IDCourseForm] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
	[IDQualification] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Percon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEducatorTopic]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEducatorTopic](
	[IDCourse] [int] NOT NULL,
	[IDEducator] [int] NOT NULL,
	[IDTopic] [int] NOT NULL,
 CONSTRAINT [PK_CourseEducatorTopic] PRIMARY KEY CLUSTERED 
(
	[IDCourse] ASC,
	[IDEducator] ASC,
	[IDTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseForm]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseForm](
	[CourseFormID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CourseForm] PRIMARY KEY CLUSTERED 
(
	[CourseFormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoursePeople]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursePeople](
	[IDCourse] [int] NOT NULL,
	[IDPeople] [int] NOT NULL,
	[RegistrationNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_CoursePeople] PRIMARY KEY CLUSTERED 
(
	[IDCourse] ASC,
	[IDPeople] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Educator]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educator](
	[EducatorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[ThirdName] [nvarchar](50) NULL,
	[Age] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDOrganization] [int] NOT NULL,
	[IDQualification] [int] NOT NULL,
 CONSTRAINT [PK_Educator] PRIMARY KEY CLUSTERED 
(
	[EducatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducatorTopic]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducatorTopic](
	[IDEducator] [int] NOT NULL,
	[IDTopic] [int] NOT NULL,
 CONSTRAINT [PK_EducatorTopic] PRIMARY KEY CLUSTERED 
(
	[IDEducator] ASC,
	[IDTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[House] [nvarchar](10) NULL,
	[Corpus] [int] NULL,
	[Rector] [nvarchar](50) NOT NULL,
	[Secretary] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PeopleID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[ThirdName] [nvarchar](50) NULL,
	[Age] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDCategory] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[PeopleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualification]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification](
	[QualificationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED 
(
	[QualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[CountHours] [int] NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Title]) VALUES (1, N'Администратор')
INSERT [dbo].[Category] ([CategoryID], [Title]) VALUES (2, N'Обучающийся')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (1, N'Воспитатель в дошкольном образовании: инклюзивное образование детей с ОВЗ в ДОО согласно ФГОС ДО', 3, CAST(N'2022-01-01' AS Date), CAST(N'2022-02-01' AS Date), 52, 25, 1, 1, 3, 1, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (2, N'Интерактивная доска: практическое использование в работе педагога (ДОО, НОО, ООО и СОО)', 2, CAST(N'2022-01-02' AS Date), CAST(N'2022-02-02' AS Date), 50, 50, 2, 2, 3, 2, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (3, N'Содержание профессиональных компетенций младшего воспитателя в условиях современного дошкольного образования в соответствии с ФГОС', 2, CAST(N'2022-01-03' AS Date), CAST(N'2022-02-03' AS Date), 62, 25, 1, 1, 3, 3, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (4, N'Старший воспитатель в дошкольном образовании: проектирование и управление образовательной деятельностью в соответствии с ФГОС ДО', 2, CAST(N'2022-01-04' AS Date), CAST(N'2022-02-04' AS Date), 66, 50, 1, 2, 3, 4, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (5, N'Профессиональная компетентность старшего воспитателя ДОО в соответствии с ФГОС ДО и профессиональным стандартом «Педагог»', 3, CAST(N'2022-01-05' AS Date), CAST(N'2022-02-05' AS Date), 56, 25, 1, 1, 3, 5, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (6, N'Деятельность образовательной организации в условиях реализации ФГОС НОО и ООО третьего поколения', 3, CAST(N'2022-02-01' AS Date), CAST(N'2022-03-01' AS Date), 64, 50, 1, 2, 3, 1, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (7, N'Обучение английскому языку при интеграции общего и дополнительного образования в условиях реализации ФГОС', 4, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-02' AS Date), 64, 25, 1, 1, 3, 2, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (8, N'Организация и содержание деятельности методиста в системе дополнительного образования детей в рамках реализации ФГОС ОО', 4, CAST(N'2022-02-03' AS Date), CAST(N'2022-03-03' AS Date), 72, 50, 0, 2, 3, 3, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (9, N'Инновационные педагогические технологии в условиях реализации ФГОС высшего образования', 5, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-04' AS Date), 58, 25, 0, 1, 3, 4, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (10, N'Инновационные педагогические технологии в условиях реализации ФГОС СПО', 5, CAST(N'2022-02-05' AS Date), CAST(N'2022-03-05' AS Date), 62, 50, 0, 2, 3, 5, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (11, N'Учебно-методическая служба в организациях СПО: организация и управление', 2, CAST(N'2022-04-01' AS Date), CAST(N'2022-05-01' AS Date), 58, NULL, 0, 3, 1, 1, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (12, N'Современные подходы к организации воспитательного процесса в образовательной организации в условиях реализации ФГОС', 3, CAST(N'2022-04-02' AS Date), CAST(N'2022-05-02' AS Date), 147, NULL, 0, 3, 1, 2, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (13, N'Безопасное информационное пространство для детей', 4, CAST(N'2022-04-03' AS Date), CAST(N'2022-05-03' AS Date), 60, 15, 1, 3, 1, 3, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (14, N'Воспитательные компетенции современного учителя', 5, CAST(N'2022-04-04' AS Date), CAST(N'2022-05-04' AS Date), 50, NULL, 1, 3, 1, 4, N'', N'Иванов И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (15, N'Тестовая программа', 4, CAST(N'2022-03-03' AS Date), CAST(N'2022-04-01' AS Date), NULL, 10, 0, 3, 2, 19, N'Тестовое', N'Тестовый И. И.')
INSERT [dbo].[Course] ([CourseID], [Program], [IDOrganization], [PlanStart], [PlanEnd], [CountHours], [CountPeopleMax], [CountPeopleNow], [IDCourseForm], [IDStatus], [IDQualification], [Description], [Percon]) VALUES (16, N'Тестовая программа', 4, CAST(N'2022-04-04' AS Date), CAST(N'2022-05-01' AS Date), NULL, 25, 0, 3, 1, 13, N'', N'Ермалаев И. Ю.')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (1, 1, 1)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (1, 4, 15)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (1, 7, 29)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (1, 10, 43)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (2, 2, 2)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (2, 5, 16)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (2, 8, 30)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (2, 11, 44)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (3, 1, 45)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (3, 3, 3)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (3, 6, 17)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (3, 9, 31)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (4, 2, 46)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (4, 3, 5)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (4, 4, 4)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (4, 7, 18)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (4, 10, 32)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (5, 3, 47)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (5, 5, 5)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (5, 8, 19)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (5, 11, 33)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (6, 1, 34)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (6, 4, 48)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (6, 6, 6)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (6, 9, 20)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (7, 2, 35)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (7, 5, 49)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (7, 7, 7)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (7, 10, 21)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (8, 3, 36)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (8, 6, 50)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (8, 8, 8)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (8, 11, 22)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (9, 1, 23)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (9, 4, 37)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (9, 7, 51)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (9, 9, 9)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (10, 2, 24)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (10, 5, 38)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (10, 8, 52)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (10, 10, 10)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (11, 3, 25)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (11, 6, 39)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (11, 9, 53)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (11, 11, 11)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (12, 1, 12)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (12, 4, 26)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (12, 7, 40)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (12, 10, 54)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (13, 2, 13)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (13, 5, 27)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (13, 8, 41)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (13, 11, 55)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (14, 1, 56)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (14, 3, 14)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (14, 6, 28)
INSERT [dbo].[CourseEducatorTopic] ([IDCourse], [IDEducator], [IDTopic]) VALUES (14, 9, 42)
GO
SET IDENTITY_INSERT [dbo].[CourseForm] ON 

INSERT [dbo].[CourseForm] ([CourseFormID], [Title]) VALUES (1, N'Очный')
INSERT [dbo].[CourseForm] ([CourseFormID], [Title]) VALUES (2, N'Очно-заочный')
INSERT [dbo].[CourseForm] ([CourseFormID], [Title]) VALUES (3, N'Дистанционный')
SET IDENTITY_INSERT [dbo].[CourseForm] OFF
GO
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (1, 1, N'11221')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (2, 1, N'21221')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (2, 4, N'21224')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (3, 3, N'32223')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (4, 5, N'42225')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (5, 3, N'53223')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (6, 4, N'63224')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (7, 4, N'74224')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (13, 4, N'Нет')
INSERT [dbo].[CoursePeople] ([IDCourse], [IDPeople], [RegistrationNum]) VALUES (14, 1, N'Нет')
GO
SET IDENTITY_INSERT [dbo].[Educator] ON 

INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (1, N'Трофимова', N'София', N'Марковна', 54, N'strofimova', N'HhHJdM', 1, 1)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (2, N'Семенова', N'Милана', N'Фёдоровна', 37, N'msemenova', N'jUzUIt', 1, 2)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (3, N'Макаров', N'Александр', N'Александрович', 53, N'amakarov', N'HDaFOd', 2, 3)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (4, N'Селиванов', N'Дмитрий', N'Егорович', 37, N'dselivanov', N'n63u3K', 2, 1)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (5, N'Новикова', N'Софья', N'Алексеевна', 40, N'snovikova', N'1iKvOD', 3, 2)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (6, N'Селезнева', N'Елизавета', N'Артёмовна', 56, N'eselezneva', N'ywg2B1', 3, 3)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (7, N'Капустина', N'Аделина', N'Степановна', 37, N'akapustina', N'iUoGsm', 4, 1)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (8, N'Кононова', N'Екатерина', N'Григорьевна', 36, N'ekononova', N'uUBCVr', 4, 2)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (9, N'Фокина', N'Мария', N'Дмитриевна', 32, N'mfokina', N'muTfcf', 5, 3)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (10, N'Короткова', N'Варвара', N'Романовна', 36, N'vkorotkova', N'UEFL', 5, 1)
INSERT [dbo].[Educator] ([EducatorID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDOrganization], [IDQualification]) VALUES (11, N'Медведева', N'Наталья', N'Викторовна', 19, N'natasha', N'natasha', 4, 2)
SET IDENTITY_INSERT [dbo].[Educator] OFF
GO
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 1)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 11)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 21)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 31)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 41)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (1, 51)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 2)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 12)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 22)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 32)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 42)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (2, 52)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 3)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 13)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 23)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 33)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 43)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (3, 53)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 4)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 14)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 24)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 34)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 44)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (4, 54)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 5)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 15)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 25)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 35)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 45)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (5, 55)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 6)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 16)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 26)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 36)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 46)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (6, 56)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 7)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 17)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 27)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 37)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 47)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (7, 57)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 8)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 18)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 28)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 38)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 48)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (8, 58)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 9)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 19)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 29)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 39)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 49)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (9, 59)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 10)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 20)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 30)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 40)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 50)
INSERT [dbo].[EducatorTopic] ([IDEducator], [IDTopic]) VALUES (10, 60)
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrganizationID], [Title], [Region], [City], [Street], [House], [Corpus], [Rector], [Secretary]) VALUES (1, N'МГУ имени М.В. Ломоносова - Московский государственный университет имени М.В. Ломоносова', N'Московская область', N'Москва', N'Микрорайон Ленинские Горы', N'1', NULL, N'Яковлев К. Ф.', N'Гришин Т. Т.')
INSERT [dbo].[Organization] ([OrganizationID], [Title], [Region], [City], [Street], [House], [Corpus], [Rector], [Secretary]) VALUES (2, N'СПГУ - Санкт-Петербургский государственный университет', N'Ленинградская область', N'Санкт-Петербург', N'Университетская набережная', N'7-9', NULL, N'Виноградов Н. Н.', N'Буров П. Д.')
INSERT [dbo].[Organization] ([OrganizationID], [Title], [Region], [City], [Street], [House], [Corpus], [Rector], [Secretary]) VALUES (3, N'НИУ ВШЭ - Национальный исследовательский университет Высшая школа экономики', N'Московская область', N'Москва', N'Мясницкая улица', N'20', 1, N'Ермаков И. М.', N'Егоров Т. И.')
INSERT [dbo].[Organization] ([OrganizationID], [Title], [Region], [City], [Street], [House], [Corpus], [Rector], [Secretary]) VALUES (4, N'КФУ - Казанский (Приволжский) федеральный университет', N'Республика Татарстан', N'Казань', N'Кремлёвская улица', N'18', NULL, N'Никольский М. Д.', N'Казакова А. А.')
INSERT [dbo].[Organization] ([OrganizationID], [Title], [Region], [City], [Street], [House], [Corpus], [Rector], [Secretary]) VALUES (5, N'ГГТУ - Государственный гуманитарно-технологический университет', N'Московская область', N'Орехово-Зуево', N'Зелёная улица', N'22', NULL, N'Королев З. Ю.', N'Попов В. Д.')
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (1, N'Морозов', N'Станислав', N'Егорович', 26, N'smorozov', N'1234', 2)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (2, N'Смирнова', N'Валерия', N'Макаровна', 24, N'vsmirnova', N'12345', 1)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (3, N'Карасев', N'Артём', N'Алексеевич', 29, N'akarasev', N'123456', 2)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (4, N'Лукьянова', N'София', N'Львовна', 38, N'slukanova', N'1234567', 2)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (5, N'Демидов', N'Никита', N'Леонидович', 44, N'ndemidov', N'12345678', 2)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (6, N'Кутлаков', N'Валерий', N'Александрович', 21, N'valera', N'valera', 1)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (7, N'Кутлаков', N'Валерий', N'Александрович', 21, N'valera1', N'valera1', 2)
INSERT [dbo].[People] ([PeopleID], [FirstName], [SecondName], [ThirdName], [Age], [Login], [Password], [IDCategory]) VALUES (8, N'л', N'т', N'п', 18, N'nloginov', N'1234', 1)
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Qualification] ON 

INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (1, N'Дошкольные образовательные организации (ДОО)')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (2, N'Воспитатель')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (3, N'Младший воспитатель, помощник воспитателя')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (4, N'Старший воспитатель')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (5, N'Преподаватели ВО, СПО')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (6, N'Специалист в области воспитания')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (7, N'Директор, заместитель директора')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (8, N'Методист')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (9, N'Социальный педагог')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (10, N'Педагог-психолог')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (11, N'Педагог-дефектолог')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (12, N'Логопед')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (13, N'Тьютор')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (14, N'Библиотекарь')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (15, N'Педагог-организатор')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (16, N'Преподаватель ДМШ, ДШИ и ДХШ')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (17, N'Тренер-преподаватель')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (18, N'Шахматы')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (19, N'Специалист социальной защиты')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (20, N'Воспитатели детей с ОВЗ')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (21, N'Инклюзивное образование, обучение лиц с ОВЗ')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (22, N'Коррекционное образование')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (23, N'Первая помощь в образовательных организациях')
INSERT [dbo].[Qualification] ([QualificationID], [Title]) VALUES (24, N'Культура и искусство')
SET IDENTITY_INSERT [dbo].[Qualification] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [Title]) VALUES (1, N'Запланирован')
INSERT [dbo].[Status] ([StatusID], [Title]) VALUES (2, N'В процессе')
INSERT [dbo].[Status] ([StatusID], [Title]) VALUES (3, N'Завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (1, N'Интерфейс программы Smart Notebook', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (2, N'Инструменты программы Smart Notebook', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (3, N'Изменение фона страницы', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (4, N'Работа с перьями', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (5, N'Создание фигур', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (6, N'Правовая база и комплексный подход к решению проблемы инклюзивного образования согласно ФГОС ДО. Модели интеграции детей', 10)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (7, N'Комплексный подход в организации психолого-педагогического сопровождения детей с ОВЗ и их родителей в условиях инклюзивного образования', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (8, N'Организационные модели инклюзивной практики в дошкольной организации', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (9, N'Итоговая аттестация', 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (10, N'Нормативно-правовые документы, обеспечивающие педагогическую деятельность в дошкольной образовательной организации', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (11, N'ФГОС ДО как ориентир развития системы дошкольного образования РФ', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (12, N'Дошкольная педагогика. Возрастная психология и физиология детей раннего и дошкольного возраста', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (13, N'Современные подходы к организации образовательного процесса в ДОО. Профессиональное развитие и саморазвитие младшего воспитателя в условиях реализации ФГОС ДО', 22)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (14, N'Методическое обеспечение дошкольного образования в условиях реализации ФГОС ДО', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (15, N'Планирование и организация образовательной деятельности с учетом ФГОС ДО', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (16, N'Организация развивающей предметно-пространственной образовательной среды в условиях ФГОС ДО', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (17, N'Модель методической службы в детском саду', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (18, N'Профессиональная деятельность старшего воспитателя детского сада', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (19, N'Кабинет старшего воспитателя ДОО', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (20, N'Профессиональное взаимодействие старшего воспитателя с педагогами и специалистами ДОО', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (21, N'Планирование образовательного процесса ДОО', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (22, N'Старший воспитатель как эксперт', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (23, N'Роль старшего воспитателя в распространении (дессеминации) идей, методов, продуктов инновационной деятельности в ДОО', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (24, N'Интеграция общего и дополнительного образования. Приоритетные направления развития системы дополнительного образования детей в условиях реализации ФГОС общего образования', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (25, N'Новые требования к преподаванию иностранных языков в условиях реализации ФГОС и научно-обоснованной концепции модернизации и технологии преподавания предметной области «Иностранный язык»', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (26, N'Обучение английскому языку в дошкольном образовании', 99)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (27, N'Методика обучения иностранному языку в начальной школе', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (28, N'Стратегия преподавания иностранного языка. Современный урок Формирование УУД.', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (29, N'Нормативно-правовые основы воспитания и дополнительного образования детей', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (30, N'Содержательные основы интеграции общего и дополнительного образования. Системно-деятельностный подход – главное условие реализации ФГОС', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (31, N'Становление воспитательной системы образовательной организации в условиях модернизации образования', 24)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (32, N'Теоретико-методологические основы инновационных процессов', 22)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (33, N'Современные педагогические технологии', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (34, N'Воспитательные технологии', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (35, N'Инновационные технологии в современном вузе', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (36, N'Развитие электронно-образовательной среды вузов', 16)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (37, N'Основные задачи и пути развития высшей школы', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (38, N'Инновационные подходы к проектированию образовательного процесса в условиях реализации ФГОС (Технология-учение о мастерстве. Стратегии преподавания в СПО. Развитие УУД)', 16)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (39, N'Современные образовательные и воспитательные технологии (Педагогические технологии в образовательном процессе. Воспитательные технологии)', 16)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (40, N'Организация и контроль образовательного процесса в СПО (Подготовка к современному учебному занятию. Методы и приемы обучения. Проведение оценочных процедур. Методические рекомендации для преподавателей и студентов)', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (41, N'Нормативно-правовые документы, регулирующие отношения в области образования и воспитания', 14)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (42, N'Воспитание – целенаправленное управление процессом формирования и развития личности через создание для этого благоприятных условий', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (43, N'Современные образовательные и воспитательные технологии в образовательном процессе', 22)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (44, N'Проектирование и реализация воспитательной работы в образовательной организации согласно ФГОС', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (45, N'Интеграция общего и дополнительного образования', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (46, N'Воспитатель группы продленного дня', 16)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (47, N'Профессионально-педагогическая деятельность в области воспитания и социализации детей и подростков', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (48, N'Роль тьютора в образовательно-воспитательной деятельности ОО', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (49, N'Нормативно-правовые основы работы методической службы организации СПО в условиях реализации ФГОС', 10)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (50, N'Компетентностный подход к методической работе в ОО', 20)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (51, N'Требования к условиям реализации ОП по ФГОС из списка профессий топ-50', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (52, N'Организация и контроль образовательного процесса', 22)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (53, N'Цифровизация в СПО', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (54, N'Интерактивное обучение и новое в образовательных технологиях', 16)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (55, N'Кейс методиста СПО', 10)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (56, N'Нормативно-правовая база защиты детей от информации, причиняющей вред их здоровью и развитию', 6)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (57, N'Internet -Ресурсы', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (58, N'Угрозы в сети Internet', 12)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (59, N'Памятка для родителей «Безопасный Интернет»', 18)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (60, N'Нормативно-правовые документы, регулирующие отношения в области образования и воспитания', 6)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (61, N'Воспитание согласно ФЗ «об образовании в РФ»: от ключевых проблем к примерной программе воспитания', 10)
INSERT [dbo].[Topic] ([TopicID], [Title], [CountHours]) VALUES (62, N'Воспитательные компетенции современного педагога', 18)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [DF_Course_IDQualification]  DEFAULT ((1)) FOR [IDQualification]
GO
ALTER TABLE [dbo].[CourseEducatorTopic] ADD  CONSTRAINT [DF_CourseEducatorTopic_IDTopic]  DEFAULT ((1)) FOR [IDTopic]
GO
ALTER TABLE [dbo].[CoursePeople] ADD  CONSTRAINT [DF_CoursePeople_RegistrationNum]  DEFAULT (N'Нет') FOR [RegistrationNum]
GO
ALTER TABLE [dbo].[Educator] ADD  CONSTRAINT [DF_Educator_IDQualification]  DEFAULT ((1)) FOR [IDQualification]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CourseForm] FOREIGN KEY([IDCourseForm])
REFERENCES [dbo].[CourseForm] ([CourseFormID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CourseForm]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Organization] FOREIGN KEY([IDOrganization])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Organization]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Qualification] FOREIGN KEY([IDQualification])
REFERENCES [dbo].[Qualification] ([QualificationID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Qualification]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Status] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Status]
GO
ALTER TABLE [dbo].[CourseEducatorTopic]  WITH CHECK ADD  CONSTRAINT [FK_CourseEducatorTopic_Course] FOREIGN KEY([IDCourse])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CourseEducatorTopic] CHECK CONSTRAINT [FK_CourseEducatorTopic_Course]
GO
ALTER TABLE [dbo].[CourseEducatorTopic]  WITH CHECK ADD  CONSTRAINT [FK_CourseEducatorTopic_Educator] FOREIGN KEY([IDEducator])
REFERENCES [dbo].[Educator] ([EducatorID])
GO
ALTER TABLE [dbo].[CourseEducatorTopic] CHECK CONSTRAINT [FK_CourseEducatorTopic_Educator]
GO
ALTER TABLE [dbo].[CourseEducatorTopic]  WITH CHECK ADD  CONSTRAINT [FK_CourseEducatorTopic_Topic] FOREIGN KEY([IDTopic])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[CourseEducatorTopic] CHECK CONSTRAINT [FK_CourseEducatorTopic_Topic]
GO
ALTER TABLE [dbo].[CoursePeople]  WITH CHECK ADD  CONSTRAINT [FK_CoursePeople_Course] FOREIGN KEY([IDCourse])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CoursePeople] CHECK CONSTRAINT [FK_CoursePeople_Course]
GO
ALTER TABLE [dbo].[CoursePeople]  WITH CHECK ADD  CONSTRAINT [FK_CoursePeople_People] FOREIGN KEY([IDPeople])
REFERENCES [dbo].[People] ([PeopleID])
GO
ALTER TABLE [dbo].[CoursePeople] CHECK CONSTRAINT [FK_CoursePeople_People]
GO
ALTER TABLE [dbo].[Educator]  WITH CHECK ADD  CONSTRAINT [FK_Educator_Organization] FOREIGN KEY([IDOrganization])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Educator] CHECK CONSTRAINT [FK_Educator_Organization]
GO
ALTER TABLE [dbo].[Educator]  WITH CHECK ADD  CONSTRAINT [FK_Educator_Qualification] FOREIGN KEY([IDQualification])
REFERENCES [dbo].[Qualification] ([QualificationID])
GO
ALTER TABLE [dbo].[Educator] CHECK CONSTRAINT [FK_Educator_Qualification]
GO
ALTER TABLE [dbo].[EducatorTopic]  WITH CHECK ADD  CONSTRAINT [FK_EducatorTopic_Educator] FOREIGN KEY([IDEducator])
REFERENCES [dbo].[Educator] ([EducatorID])
GO
ALTER TABLE [dbo].[EducatorTopic] CHECK CONSTRAINT [FK_EducatorTopic_Educator]
GO
ALTER TABLE [dbo].[EducatorTopic]  WITH CHECK ADD  CONSTRAINT [FK_EducatorTopic_Topic] FOREIGN KEY([IDTopic])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[EducatorTopic] CHECK CONSTRAINT [FK_EducatorTopic_Topic]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Category]
GO
/****** Object:  StoredProcedure [dbo].[AddCoursePeople]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCoursePeople] 
@idCourse INT, @idPeople INT
AS
BEGIN
	INSERT INTO CoursePeople(IDCourse, IDPeople) VALUES(@idCourse, @idPeople)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCoursePeople]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCoursePeople] 
@idCourse INT, @idPeople INT
AS
BEGIN
	DELETE CoursePeople 
	WHERE IDCourse = @idCourse AND IDPeople = @idPeople
END
GO
/****** Object:  StoredProcedure [dbo].[EducatorFIO]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EducatorFIO]
@idOrganization INT
AS
BEGIN
	SELECT EducatorID, (FirstName + ' ' + SecondName + ' ' + ThirdName) AS EducatorName FROM Educator
	WHERE IDOrganization = @idOrganization
END
GO
/****** Object:  StoredProcedure [dbo].[PeopleFIO]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PeopleFIO]
@idCourse INT
AS
BEGIN
	SELECT * FROM People
	WHERE PeopleID IN (SELECT IDPeople FROM CoursePeople WHERE IDCourse = @idCourse)
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrationNumCreate]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrationNumCreate] 
AS
BEGIN
	UPDATE [dbo].[CoursePeople] SET RegistrationNum = 
	CAST(IDCourse AS NVARCHAR(50)) + 
	CAST((SELECT IDOrganization FROM [dbo].[Course] WHERE CourseID = IDCourse) AS NVARCHAR(50)) + 
	CAST(DAY(GETDATE()) AS NVARCHAR(50)) + CAST(IDPeople AS NVARCHAR(50))
	WHERE RegistrationNum = 'Нет'
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourse]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCourse] 
AS
BEGIN
SELECT dbo.Course.CourseID, dbo.Course.Program, dbo.Course.PlanStart, dbo.Course.PlanEnd, dbo.Status.Title AS StatusTitle, 
dbo.Organization.Title AS OrganizationTitle, dbo.Qualification.Title AS QualificationTitle, 
dbo.Course.CountHours, dbo.Course.CountPeopleNow, dbo.Course.CountPeopleMax, dbo.CourseForm.Title AS CourseFormTitle
FROM dbo.Course INNER JOIN dbo.CourseForm ON dbo.Course.IDCourseForm = dbo.CourseForm.CourseFormID 
				INNER JOIN dbo.Organization ON dbo.Course.IDOrganization = dbo.Organization.OrganizationID 
				INNER JOIN dbo.Qualification ON dbo.Course.IDQualification = dbo.Qualification.QualificationID 
				INNER JOIN dbo.Status ON dbo.Course.IDStatus = dbo.Status.StatusID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourseCourseID]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCourseCourseID]
@idCourse INT
AS
BEGIN
SELECT dbo.Course.CourseID, dbo.Course.Program, dbo.Course.PlanStart, dbo.Course.PlanEnd, dbo.Status.Title AS StatusTitle, 
dbo.Organization.Title AS OrganizationTitle, dbo.Qualification.Title AS QualificationTitle, 
dbo.Course.CountHours, dbo.Course.CountPeopleNow, dbo.Course.CountPeopleMax, dbo.CourseForm.Title AS CourseFormTitle
FROM dbo.Course INNER JOIN dbo.CourseForm ON dbo.Course.IDCourseForm = dbo.CourseForm.CourseFormID 
				INNER JOIN dbo.Organization ON dbo.Course.IDOrganization = dbo.Organization.OrganizationID 
				INNER JOIN dbo.Qualification ON dbo.Course.IDQualification = dbo.Qualification.QualificationID 
				INNER JOIN dbo.Status ON dbo.Course.IDStatus = dbo.Status.StatusID
WHERE Course.CourseID = @idCourse
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourseEducatorTopic]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCourseEducatorTopic]
@idCourse INT
AS
BEGIN
	SELECT IDCourse, IDEducator, IDTopic FROM CourseEducatorTopic
	WHERE IDCourse = @idCourse
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourseEducatorTopicIDCourse]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCourseEducatorTopicIDCourse]
	@idCourse INT
AS
BEGIN
	SELECT dbo.CourseEducatorTopic.IDCourse, dbo.CourseEducatorTopic.IDEducator, 
		   dbo.CourseEducatorTopic.IDTopic, dbo.Topic.Title, dbo.Educator.FirstName, dbo.Educator.SecondName
	FROM dbo.CourseEducatorTopic INNER JOIN dbo.Educator ON dbo.CourseEducatorTopic.IDEducator = dbo.Educator.EducatorID 
	INNER JOIN dbo.Topic ON dbo.CourseEducatorTopic.IDTopic = dbo.Topic.TopicID
WHERE dbo.CourseEducatorTopic.IDCourse = @idCourse
END
GO
/****** Object:  StoredProcedure [dbo].[SelectRegistrationNumber]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectRegistrationNumber]
@courseID INT, @peopleID INT
AS
BEGIN
	SELECT RegistrationNum FROM CoursePeople
	WHERE IDCourse = @courseID AND IDPeople = @peopleID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourse]
@ID INT, 
@program NVARCHAR(MAX), 
@organization INT, 
@start DATE, 
@end DATE, 
@peopleMax INT, 
@form INT,
@qualification INT,
@person NVARCHAR(50),
@description NVARCHAR(MAX)
AS
BEGIN
	UPDATE Course SET Program = @program, IDOrganization = @organization, PlanStart = @start, PlanEnd = @end,
	CountPeopleMax = @peopleMax, IDCourseForm = @form, IDQualification = @qualification,  
	Percon = @person, Description = @description
	WHERE CourseID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseHoursPeopleCount]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourseHoursPeopleCount]
AS
BEGIN
	UPDATE Course 
	SET CountHours = (SELECT SUM(CountHours) FROM Topic WHERE TopicID IN 
	(SELECT IDTopic FROM CourseEducatorTopic WHERE IDCourse = CourseID)),
	CountPeopleNow = (SELECT COUNT(*) FROM CoursePeople WHERE IDCourse = CourseID)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganization]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrganization]
@ID INT, @title NVARCHAR(MAX), @region NVARCHAR(50), @city NVARCHAR(50), @street NVARCHAR(50), @house NVARCHAR(50), @corpus INT, @rector NVARCHAR(50), @secretary NVARCHAR(50)
AS
BEGIN
	UPDATE Organization SET Title = @title, Region = @region, City = @city, Street = @street, House = @house, Corpus = @corpus, Rector = @rector, Secretary = @secretary
	WHERE OrganizationID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateQualification]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateQualification]
@ID INT, @title nvarchar(50)
AS
BEGIN
	UPDATE Qualification SET Title = @title
	WHERE QualificationID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatusEnd]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatusEnd]
AS
BEGIN
	UPDATE Course
	SET IDStatus = 3
	WHERE PlanEnd <= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatusInProcess]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatusInProcess]
AS
BEGIN
	UPDATE Course
	SET IDStatus = 2
	WHERE PlanStart <= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTopic]    Script Date: 29.04.2022 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTopic]
@ID INT, @title nvarchar(MAX), @hours INT
AS
BEGIN
	UPDATE Topic SET Title = @title, CountHours = @hours
	WHERE TopicID = @ID
END
GO
USE [master]
GO
ALTER DATABASE [TrainingCourses] SET  READ_WRITE 
GO
