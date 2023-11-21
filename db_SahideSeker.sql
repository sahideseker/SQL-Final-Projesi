USE master
GO
/****** Veritabanını Oluşturma ******/
CREATE DATABASE db_SahideSeker
ON PRIMARY 
(NAME = 'db_SahideSeker', FILENAME = 'd:\db_SahideSeker.mdf', SIZE = 5120KB, FILEGROWTH = 1024KB)
 LOG ON 
(NAME = 'db_SahideSeker_log', FILENAME = 'd:\db_SahideSeker_log.ldf', SIZE = 1024KB , FILEGROWTH = 1024KB)
GO
ALTER DATABASE db_SahideSeker SET COMPATIBILITY_LEVEL = 150
GO
USE db_SahideSeker
GO

--Bölümler Tablosu
CREATE TABLE [dbo].[tbl_Departments](
	[Dept_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [nvarchar](50) NOT NULL,
	[Dept_Phone] [char](15) NOT NULL,
	[Manager_ID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Departments] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Personeller Tablosu
CREATE TABLE [dbo].[tbl_Employees](
	[Empl_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_FName] [nvarchar](50) NOT NULL,
	[Empl_LName] [nvarchar](50) NOT NULL,
	[Empl_BDate] [date] NULL,
	[Emp _Start_Date] [date] NULL,
	[Empl_Left_Date] [date] NULL,
	[Empl_Address] [nvarchar](100) NULL,
	[Empl_City] [nvarchar](20) NULL,
	[Empl_Province] [nvarchar](20) NULL,
	[Empl_Phone] [char](15) NULL,
	[Empl_Cell] [char](15) NULL,
	[Empl_Email] [nvarchar](50) NULL,
	[Dept_ID] [int] NOT NULL,
	[Gender_ID] [int] NOT NULL,
	[Title_ID] [int] NOT NULL,
	[Empl_Photo] [image] NULL,
	[Empl_CV] [nvarchar](50) NULL,
	[Empl_CV_File] [nvarchar](50) NULL,
	[Empl_CV_Web] [nvarchar](100) NULL,
	[Entered_By] [nvarchar](50) NULL,
	[Entered_Date] [date] NULL,
	[Is_Empl_Active] [bit] NULL,
	[Empl_Name]  AS (([Empl_FName]+' ')+[Empl_LName]),
 CONSTRAINT [PK_tbl_Employees] PRIMARY KEY CLUSTERED 
(
	[Empl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Maaşlar Tablosu
CREATE TABLE [dbo].[tbl_EmployeeWages](
	[Wage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_ID] [int] NOT NULL,
	[Wage_Paid_Date] [date] NOT NULL,
	[Wage_Amount] [money] NOT NULL,
	[Wage_Commission] [money] NOT NULL,
	[Month_ID] [int] NOT NULL,
	[Wage_Year]  AS (datepart(year,[Wage_Paid_Date])), 
	[Wage_Total]  AS ([Wage_Amount]+[Wage_Commission]),
 CONSTRAINT [PK_tbl.EmployeeWages] PRIMARY KEY CLUSTERED 
(
	[Wage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Kategoriler Tablosu
CREATE TABLE [dbo].[tbl_Lookups](
	[LK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [char](5) NULL,
	[Title] [nvarchar](20) NULL,
	[City] [nvarchar](20) NOT NULL,
	[Province] [nvarchar](20) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[Month] [nvarchar](20) NOT NULL,
	[Role] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl_Lookups] PRIMARY KEY CLUSTERED 
(
	[LK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Kullanıcılar Tablosu

CREATE TABLE [dbo].[tbl_Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[User_Psw] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Veri Girişi
SET IDENTITY_INSERT [dbo].[tbl_Departments] ON 

INSERT INTO tbl_Departments  (Dept_ID, Dept_Name, Dept_Phone, Manager_ID) VALUES (1, N'Bilgi İşlem', N'3721112222     ', 1)
INSERT INTO tbl_Departments  (Dept_ID, Dept_Name, Dept_Phone, Manager_ID) VALUES (2, N'Pazarlama', N'3724326666     ', 2)
INSERT INTO tbl_Departments  (Dept_ID, Dept_Name, Dept_Phone, Manager_ID) VALUES (4, N'Satış', N'3726789999     ', 2)
INSERT INTO tbl_Departments  (Dept_ID, Dept_Name, Dept_Phone, Manager_ID) VALUES (5, N'Muhasebe', N'3729874545     ', 3)
INSERT INTO tbl_Departments  (Dept_ID, Dept_Name, Dept_Phone, Manager_ID) VALUES (6, N'Finans', N'3724563333     ', 3)
SET IDENTITY_INSERT [dbo].[tbl_Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT INTO tbl_Employees (Empl_ID, Empl_FName, Empl_LName, Empl_BDate, [Emp _Start_Date], Empl_Left_Date, Empl_Address, Empl_City, Empl_Province, Empl_Phone, Empl_Cell, Empl_Email, Dept_ID, Gender_ID,Title_ID, Empl_Photo, Empl_CV, Empl_CV_File, Empl_CV_Web, Entered_By, Entered_Date, Is_Empl_Active) VALUES (1, N'Mustafa', N'Gül', CAST(N'1962-01-01' AS Date), CAST(N'2022-10-16' AS Date), NULL, N'Upper St. No 1', N'Kdz.Eregli', N'Zonguldak', N'123 333 5555   ', N'5371111222     ', N'mcoruh@gmail.com', 1, 1, 1, NULL, NULL, NULL, NULL, N'Ali Yılmaz', CAST(N'2022-09-16' AS Date), 1)
INSERT INTO tbl_Employees (Empl_ID, Empl_FName, Empl_LName, Empl_BDate, [Emp _Start_Date], Empl_Left_Date, Empl_Address, Empl_City, Empl_Province, Empl_Phone, Empl_Cell, Empl_Email, Dept_ID, Gender_ID,Title_ID, Empl_Photo, Empl_CV, Empl_CV_File, Empl_CV_Web, Entered_By, Entered_Date, Is_Empl_Active) VALUES (6, N'Bugra ', N'Diniz', CAST(N'1998-01-01' AS Date), CAST(N'2022-10-16' AS Date), NULL, N'Down St. No 12', N'Kavacık', N'Istanbul', N'123 444 6666   ', N'5462345443     ', N'bdiniz@gmail.com', 2, 1, 3, NULL, NULL, NULL, NULL, N'Ayşe Kaya', CAST(N'2022-09-13' AS Date), 1)
INSERT INTO tbl_Employees (Empl_ID, Empl_FName, Empl_LName, Empl_BDate, [Emp _Start_Date], Empl_Left_Date, Empl_Address, Empl_City, Empl_Province, Empl_Phone, Empl_Cell, Empl_Email, Dept_ID, Gender_ID,Title_ID, Empl_Photo, Empl_CV, Empl_CV_File, Empl_CV_Web, Entered_By, Entered_Date, Is_Empl_Active) VALUES (12, N'Burak', N'Oguz', CAST(N'1993-01-01' AS Date), CAST(N'2022-10-16' AS Date), NULL, N'South St No 5', N'Sincan', N'Ankara', N'123 777 8998   ', N'5433332112     ', N'boguz@gmail.com', 4, 1, 2, NULL, NULL, NULL, NULL, N'Can Öztürk', CAST(N'2022-09-10' AS Date), 1)
INSERT INTO tbl_Employees (Empl_ID, Empl_FName, Empl_LName, Empl_BDate, [Emp _Start_Date], Empl_Left_Date, Empl_Address, Empl_City, Empl_Province, Empl_Phone, Empl_Cell, Empl_Email, Dept_ID, Gender_ID,Title_ID, Empl_Photo, Empl_CV, Empl_CV_File, Empl_CV_Web, Entered_By, Entered_Date, Is_Empl_Active) VALUES (14, N'Ayse', N'Meliha', CAST(N'1968-01-01' AS Date), CAST(N'2022-10-10' AS Date), NULL, N'North St. No 9', N'Nilüfer', N'Bursa', N'123 666 7898   ', N'5435674343     ', N'mayse@gmail.com', 5, 2, 4, NULL, NULL, NULL, NULL, N'Esra Arslan', CAST(N'2022-09-09' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] ON 

INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (1, 1, CAST(N'2021-07-10' AS Date), 3540.0000, 0.0000, 7)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (3, 1, CAST(N'2021-08-10' AS Date), 3540.0000, 0.0000, 8)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (5, 1, CAST(N'2021-09-10' AS Date), 3540.0000, 0.0000, 9)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (6, 1, CAST(N'2021-10-10' AS Date), 3540.0000, 0.0000, 10)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (7, 1, CAST(N'2021-11-10' AS Date), 3540.0000, 0.0000, 11)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (9, 1, CAST(N'2021-12-10' AS Date), 3540.0000, 0.0000, 12)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (11, 6, CAST(N'2021-11-10' AS Date), 2500.0000, 1200.0000, 11)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (12, 6, CAST(N'2021-12-10' AS Date), 2500.0000, 1000.0000, 12)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (14, 12, CAST(N'2021-12-10' AS Date), 3000.0000, 1000.0000, 12)
INSERT INTO tbl_EmployeeWages (Wage_ID, Empl_ID, Wage_Paid_Date, Wage_Amount, Wage_Commission, Month_ID) VALUES (15, 14, CAST(N'2021-12-10' AS Date), 3500.0000, 0.0000, 12)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Lookups] ON 

INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (1, N'Erkek', N'VTY', N'Kavacık', N'İstanbul', N'Türkiye', N'Ocak', N'Admin')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (2, N'Kadin', N'Müdür', N'Sincan', N'Ankara', N'Türkiye', N'Şubat', N'Veri')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (3, NULL, N'Muhasebeci', N'Kdz.Ereğli', N'Bursa', N'UK', N'Mart', N'Yönetici')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (4, NULL, N'Satış', N'Alaplı', N'Zonguldak', N'Kanada', N'Nisan', N'Raporcu')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (5, NULL, N'CIO', N'Şişli', N'Sakarya', N'Meksika', N'Mayıs', N'Mühendis')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (6, NULL, N'CEO', N'Ataşehir', N'İzmir', N'Almanya', N'Haziran', N'Genel Yönetici')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (7, NULL, N'İnşaat Mühendisi', N'Seyhan', N'Adana', N'İngiltere', N'Temmuz', N'Proje Yönetimi')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (8, NULL, N'Finans Uzmanı', N'Akşehir', N'Konya', N'Danimarka', N'Ağustos', N'Risk Yönetimi')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (9, NULL, N'Yazılım Geliştirici', N'Tarsus', N'Mersin', N'Hollanda', N'Eylül', N'Backend Geliştirme')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (10, NULL, N'Elektrik Mühendisi', N'Muratpaşa', N'Antalya', N'Belçika', N'Ekim', N'Dağıtım Planlama')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (11, NULL, N'Grafik Tasarımcısı', N'Melikgazi', N'Kayseri', N'Polonya', N'Kasım', N'Kreatif Tasarım')
INSERT INTO tbl_Lookups (LK_ID, Gender, Title, City, Province, Country, Month, Role) VALUES (15, NULL, N'Lojistik', N'Derince', N'Kocaeli', N'Avusturya', N'Aralık', N'Tedarik Yönetimi')
SET IDENTITY_INSERT [dbo].[tbl_Lookups] OFF

SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT INTO tbl_Users (User_ID, User_Name, User_Psw, Role_ID) VALUES (1, N'Mustafa', 123, 1)
INSERT INTO tbl_Users (User_ID, User_Name, User_Psw, Role_ID)  VALUES (2, N'Admin', 3540, 2)
INSERT INTO tbl_Users (User_ID, User_Name, User_Psw, Role_ID)  VALUES (3, N'Rapor', 3540, 3)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO

--İlişkileri kurma

ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Emp _Start_Date]  DEFAULT (getdate()) FOR [Emp _Start_Date]
GO
ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Gender_ID]  DEFAULT ((1)) FOR [Gender_ID]
GO
ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Is_Empl_Active]  DEFAULT ((1)) FOR [Is_Empl_Active]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Departments] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[tbl_Departments] ([Dept_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Departments]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups1] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups1]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees] FOREIGN KEY([Empl_ID])
REFERENCES [dbo].[tbl_Employees] ([Empl_ID])
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Lookups] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Lookups]
GO

-- Tabloları Sorgulama 

SELECT * FROM tbl_Lookups
SELECT * FROM tbl_Departments
SELECT * FROM tbl_Employees
SELECT * FROM tbl_EmployeeWages
SELECT * FROM tbl_Users


























