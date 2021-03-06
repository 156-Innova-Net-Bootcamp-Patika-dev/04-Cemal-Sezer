USE [master]
GO
/****** Object:  Database [E-Commerce]    Script Date: 29.01.2022 05:36:17 ******/
CREATE DATABASE [E-Commerce] ON  PRIMARY 
( NAME = N'E-Commerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\E-Commerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E-Commerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\E-Commerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E-Commerce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Commerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Commerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Commerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Commerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Commerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Commerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Commerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Commerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Commerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Commerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Commerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Commerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Commerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Commerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Commerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Commerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Commerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Commerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-Commerce] SET  MULTI_USER 
GO
ALTER DATABASE [E-Commerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Commerce] SET DB_CHAINING OFF 
GO
USE [E-Commerce]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Parenid] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsPopular] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Phone] [char](11) NULL,
	[Userid] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identityNumber] [char](11) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LangCate]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangCate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[CateId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_LangCate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageK]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageK](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[key] [varchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LangValues]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KeyId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LangValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Orderdate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[Adress] [varchar](50) NOT NULL,
	[PaymentType] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
	[ShippingFee] [money] NULL,
	[OrderStatusId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCate]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [IX_ProductCate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
	[Price] [money] NOT NULL,
	[Supplierld] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierProd]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ProdId] [int] NOT NULL,
	[IsActibe] [bit] NOT NULL,
 CONSTRAINT [PK_SupplierProd] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](10) NOT NULL,
	[TaxNumber] [char](10) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.01.2022 05:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](120) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [UK_Customers_identityNumber]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UK_Customers_identityNumber] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_LangCate_LangId_CateId]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[LangCate] ADD  CONSTRAINT [UK_LangCate_LangId_CateId] UNIQUE NONCLUSTERED 
(
	[CateId] ASC,
	[LangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_LangValues_KeyId_LanguageId]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[LangValues] ADD  CONSTRAINT [UK_LangValues_KeyId_LanguageId] UNIQUE NONCLUSTERED 
(
	[KeyId] ASC,
	[LangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_OrderDetails_OrderId_ProductId]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [UK_OrderDetails_OrderId_ProductId] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_ProductCate_Products_Categories]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[ProductCate] ADD  CONSTRAINT [UK_ProductCate_Products_Categories] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_SupplierProd_SupplierId_ProductId]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[SupplierProd] ADD  CONSTRAINT [UK_SupplierProd_SupplierId_ProductId] UNIQUE NONCLUSTERED 
(
	[ProdId] ASC,
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Suppliers_TaxNumber]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [UK_Suppliers_TaxNumber] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Uk_Users_Email]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Uk_Users_Email] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Users_Username]    Script Date: 29.01.2022 05:36:17 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Username] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Orderdate]  DEFAULT (getdate()) FOR [Orderdate]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([Parenid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Users] FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Users]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[LangCate]  WITH CHECK ADD  CONSTRAINT [FK_LangCate_Categories] FOREIGN KEY([CateId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[LangCate] CHECK CONSTRAINT [FK_LangCate_Categories]
GO
ALTER TABLE [dbo].[LangCate]  WITH CHECK ADD  CONSTRAINT [FK_LangCate_Languages] FOREIGN KEY([id])
REFERENCES [dbo].[Languages] ([id])
GO
ALTER TABLE [dbo].[LangCate] CHECK CONSTRAINT [FK_LangCate_Languages]
GO
ALTER TABLE [dbo].[LangValues]  WITH CHECK ADD  CONSTRAINT [FK_LangValues_LanguageK] FOREIGN KEY([KeyId])
REFERENCES [dbo].[LanguageK] ([id])
GO
ALTER TABLE [dbo].[LangValues] CHECK CONSTRAINT [FK_LangValues_LanguageK]
GO
ALTER TABLE [dbo].[LangValues]  WITH CHECK ADD  CONSTRAINT [FK_LangValues_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([id])
GO
ALTER TABLE [dbo].[LangValues] CHECK CONSTRAINT [FK_LangValues_Languages]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentTypes] FOREIGN KEY([PaymentType])
REFERENCES [dbo].[PaymentTypes] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shippers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[ProductCate]  WITH CHECK ADD  CONSTRAINT [FK_ProductCate_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCate] CHECK CONSTRAINT [FK_ProductCate_Categories]
GO
ALTER TABLE [dbo].[ProductCate]  WITH CHECK ADD  CONSTRAINT [FK_ProductCate_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductCate] CHECK CONSTRAINT [FK_ProductCate_Products]
GO
ALTER TABLE [dbo].[Shippers]  WITH CHECK ADD  CONSTRAINT [FK_Shippers_Users] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [FK_Shippers_Users]
GO
ALTER TABLE [dbo].[SupplierProd]  WITH CHECK ADD  CONSTRAINT [FK_SupplierProd_Products] FOREIGN KEY([ProdId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[SupplierProd] CHECK CONSTRAINT [FK_SupplierProd_Products]
GO
ALTER TABLE [dbo].[SupplierProd]  WITH CHECK ADD  CONSTRAINT [FK_SupplierProd_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[SupplierProd] CHECK CONSTRAINT [FK_SupplierProd_Suppliers]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Users] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Users]
GO
USE [master]
GO
ALTER DATABASE [E-Commerce] SET  READ_WRITE 
GO
