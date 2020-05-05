USE [SenDaDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](150) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Mobi] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[AccountCategoryID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCategory](
	[AccountCategoryID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Content] [nvarchar](4000) NULL,
	[ViewTime] [int] NULL,
	[Price] [float] NULL,
	[OldPrice] [float] NULL,
	[Promotions] [nvarchar](4000) NULL,
	[WarrantyPolicy] [nvarchar](4000) NULL,
	[Specifications] [nvarchar](4000) NULL,
	[Accessories] [nvarchar](4000) NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ArticleCategoryID] [int] NULL,
	[sourcelink] [nvarchar](1000) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[SourcePage] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ArticleMainCategoryID] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleMainCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleMainCategory](
	[ArticleMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Mobi] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ApproveBy] [nvarchar](50) NULL,
	[ClientCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCategory](
	[ClientCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Mobi] [nvarchar](20) NULL,
	[Content] [ntext] NULL,
	[AttachmentFile] [nvarchar](4000) NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ApproveBy] [nvarchar](50) NULL,
	[ContactCategoryID] [int] NULL,
	[topic] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Email] [nvarchar](255) NULL,
	[FullName] [nvarchar](50) NULL,
	[Mobi] [nvarchar](20) NULL,
	[Mobi2] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Gender] [bit] NULL,
	[PaymentMethod] [int] NULL,
	[Comment] [nvarchar](4000) NULL,
	[OrderStatus] [bit] NULL,
	[DeliverStatus] [bit] NULL,
	[ChargeStatus] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ClientID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[ViewTime] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[PictureCategoryID] [int] NULL,
	[Link] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureCategory](
	[PictureCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[ViewTime] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[PictureMainCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureMainCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureMainCategory](
	[PictureMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[ViewTime] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[ViewTime] [int] NULL,
	[Price] [float] NULL,
	[OldPrice] [float] NULL,
	[Promotions] [nvarchar](4000) NULL,
	[WarrantyPolicy] [nvarchar](4000) NULL,
	[Specifications] [nvarchar](4000) NULL,
	[Accessories] [nvarchar](4000) NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ProductCategoryID] [int] NULL,
	[ImagesList] [nvarchar](4000) NULL,
	[Content] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ProductMainCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMainCategory]    Script Date: 4/27/2020 8:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMainCategory](
	[ProductMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Dercription] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobi], [Address], [Gender], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'Admin', N'123', N'/FileUpload/image/account/cf775e39-1800-4217-84dd-2fcdaf32f137.jpg', N'/FileUpload/image/account/cf775e39-1800-4217-84dd-2fcdaf32f137.jpg', N'Đào Quốc Khánh 123', N'Chuvanan258vn@gmail.com', N'0123456789', N'Bình Dương', 1, 1, CAST(N'2020-04-15 14:00:00.000' AS DateTime), N'SupperAdmin')
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobi], [Address], [Gender], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'admin411414', N'123', N'/Admin/images/no_image.png', N'/Admin/images/no_image.png', N'Đào Quốc Khánh 123', N'quocminh258vn@gmail.com', N'23456543', N'adawd', 0, 1, CAST(N'2020-04-18 20:35:43.550' AS DateTime), N'SupperAdmin')
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobi], [Address], [Gender], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'hungchim', N'123', N'/FileUpload/image/account/d73ad078-2958-4281-b2c9-4b50381ebe80.jpg', N'/FileUpload/image/account/d73ad078-2958-4281-b2c9-4b50381ebe80.jpg', N'hùng chim', N'hungchim258vn@gmail.com', N'09888888888', N'Bến Cát', 1, 1, CAST(N'2020-04-16 04:28:26.500' AS DateTime), N'Admin')
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobi], [Address], [Gender], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'minh11223', N'123', N'/Admin/images/no_image.png', N'/Admin/images/no_image.png', N'minh hiếu', N'minhhieu@gmail.com', N'09888888888', N'thii654', 1, 1, CAST(N'2020-04-18 20:30:37.147' AS DateTime), N'Admin')
INSERT [dbo].[AccountCategory] ([AccountCategoryID], [Title], [Description], [Avatar], [Thumb], [Status], [Position]) VALUES (N'Admin', N'Quản trị viên cơ bản', N'Quản trị viên cơ bản được phép thực hiện các thao tác quản trị website', N'../Admin/images/icon/admin/quockhanh.jpg"', N'../Admin/images/icon/admin/quockhanh.jpg"', 1, 2)
INSERT [dbo].[AccountCategory] ([AccountCategoryID], [Title], [Description], [Avatar], [Thumb], [Status], [Position]) VALUES (N'SupperAdmin', N'Quản trị cao cấp', N'Quản trị hệ thống có toàn quyền trên hệ thống', N'../Admin/images/icon/admin/quockhanh.jpg"', N'../Admin/images/icon/admin/quockhanh.jpg"', 1, 1)
INSERT [dbo].[AccountCategory] ([AccountCategoryID], [Title], [Description], [Avatar], [Thumb], [Status], [Position]) VALUES (N'user123', N'Công nghệ', N'dadawdawdawd', N'/Admin/images/no_image.png', N'/Admin/images/no_image.png', 1, 3)
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Content], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID], [sourcelink], [UpdateBy], [SourcePage]) VALUES (15, N'', N'Nhân giống sen đá bằng nước và chai nhựa112341243', N'Nhân giống sen đá bằng nước và chai nhựa1', N'/FileUpload/image/Article/ee342d6b-a1a6-42f2-bdc8-f45c192d6c86.jpg', N'/FileUpload/image/Article/ee342d6b-a1a6-42f2-bdc8-f45c192d6c86.jpg', N'Nhân giống sen đá bằng nước và chai nhựa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12111, CAST(N'2020-04-22 00:27:43.427' AS DateTime), N'Admin', 1, N'https://www.vuonsenda.vn/blogs/news', NULL, N'vuonsenda')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleCategory] ON 

INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (1, N'', N'Sen Đá', N'Bài Viết Liên Quan Đến Việc Chăm Sóc Sen Đá', N'/FileUpload/image/ArticleCategory/a288b6eb-99e5-4047-8fa7-c24c7a700683.png', N'/FileUpload/image/ArticleCategory/a288b6eb-99e5-4047-8fa7-c24c7a700683.png', 1, 1, NULL, N'Admin', 1, NULL)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (2, N'', N'Xương Rồng', N'Bài Viết Liên Quan Đến Việc Chăm Sóc Xương Rồng', N'/FileUpload/image/ArticleCategory/a740b3eb-3c91-48b2-b49f-e748776c8150.png', N'/FileUpload/image/ArticleCategory/a740b3eb-3c91-48b2-b49f-e748776c8150.png', 1, 2, NULL, N'Admin', 1, NULL)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (3, N'', N'Chậu Cảnh', N'Bài Viết Liên Quan Đến Việc Chăm Sóc Chậu Cảnh', N'/FileUpload/image/ArticleCategory/ffd8579e-4b3d-46ff-99fa-9c6c64840791.png', N'/FileUpload/image/ArticleCategory/ffd8579e-4b3d-46ff-99fa-9c6c64840791.png', 1, 3, NULL, N'Admin', 1, NULL)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (4, NULL, N'Tin Tức Sen Đá', NULL, NULL, NULL, NULL, NULL, NULL, N'admin', 2, NULL)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (5, NULL, N'Tin Tức Xương Rồng', NULL, NULL, NULL, NULL, NULL, NULL, N'admin', 2, NULL)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ArticleMainCategoryID], [UpdateBy]) VALUES (6, NULL, N'Tin Tức Chậu Cảnh', NULL, NULL, NULL, NULL, NULL, NULL, N'admin', 2, NULL)
SET IDENTITY_INSERT [dbo].[ArticleCategory] OFF
SET IDENTITY_INSERT [dbo].[ArticleMainCategory] ON 

INSERT [dbo].[ArticleMainCategory] ([ArticleMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [UpdateBy]) VALUES (1, N'', N'Chăm Sóc Sen Đá', N'những bài viết về chăm sóc sen đá', N'/FileUpload/image/ArticleMainCategory/85d33152-42f2-4185-a6d6-45870c8ed3c1.png', N'/FileUpload/image/ArticleMainCategory/85d33152-42f2-4185-a6d6-45870c8ed3c1.png', 1, 1, NULL, N'admin', NULL)
INSERT [dbo].[ArticleMainCategory] ([ArticleMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [UpdateBy]) VALUES (2, N'', N'Bài Viết Về Sen Đá', N'Những bài biết về sen đá', N'/FileUpload/image/ArticleMainCategory/5f3e7bb9-6720-47ec-94ce-9e4b92bf2ec7.png', N'/FileUpload/image/ArticleMainCategory/5f3e7bb9-6720-47ec-94ce-9e4b92bf2ec7.png', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[ArticleMainCategory] ([ArticleMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [UpdateBy]) VALUES (6, N'', N'demo', N'demo', N'/Admin/images/no_image.png', N'/Admin/images/no_image.png', 1, 3, NULL, N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[ArticleMainCategory] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (1, NULL, N'chuvanan258vn@gmail.com', N'123456', N'khánh đẹp zai', NULL, NULL, N'2345', NULL, NULL, NULL, NULL, N'admin', NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (2, NULL, N'admin', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (3, NULL, N'chuvanan358vn@gmail.com', N'123', N'minh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (4, NULL, N'chu@gmail.com', N'123', N'khavs', NULL, NULL, N'1324567', N'qwertyj', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (5, NULL, N'khanh258vn@gmail.com', N'123', N'minhdadad', NULL, NULL, N'098765412', N'bfdADAWDAWDAD', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (6, NULL, N'admin@gmail.com', N'123', N'adadadawdawdawda', NULL, NULL, N'113246578086756454', N'wqawsedrgtfh', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (7, NULL, N'admin@gmail.com', N'123', N'adadadawdawdawda', NULL, NULL, N'113246578086756454', N'wqawsedrgtfh', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (8, NULL, N'admin@gmail.com', N'123', N'adwadwa', NULL, NULL, N'131245', N'qewasfdgvnh', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ClientID], [Code], [Email], [Password], [FullName], [Avatar], [Thumb], [Mobi], [Address], [Gender], [Status], [CreateTime], [ApproveBy], [ClientCategoryID]) VALUES (9, NULL, N'khanh369vn@gmail.com', N'123', N'khánh', NULL, NULL, N'09876543131', N'hóc môn', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (20, NULL, N'minh dương', N'quockhanh258vn@gmail.com', NULL, N'0797891220', N'can62 tu7 van61', NULL, 0, CAST(N'2020-03-25 10:01:40.433' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (21, NULL, N'minh dương', N'quockhanh258vn@gmail.com', NULL, N'0797891220', N'can62 tu7 van61', NULL, 0, CAST(N'2020-03-25 10:01:57.863' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (22, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:02:29.707' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (23, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:04:31.917' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (24, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:04:57.357' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (25, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:05:07.610' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (26, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:05:18.940' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (27, NULL, N'minh dương', N'quockhanh258vn@gmail.com', NULL, N'09425675809', N'cần tư vấn', NULL, 0, CAST(N'2020-03-25 10:05:43.610' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (28, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'cc', NULL, 0, CAST(N'2020-03-25 10:07:31.330' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (29, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'NOI DUNG', NULL, 0, CAST(N'2020-03-25 10:12:30.343' AS DateTime), NULL, NULL, N'42114')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (30, NULL, N'quốc khánh', N'quockhanh@gmail.com', NULL, N'09425675809', N'dada', NULL, 0, CAST(N'2020-03-25 10:16:42.007' AS DateTime), NULL, NULL, N'42114')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (31, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'wafsdm', NULL, 0, CAST(N'2020-03-25 10:18:23.637' AS DateTime), NULL, NULL, N'987')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (32, NULL, N'minh dương', N'quockhanh@gmail.com', NULL, N'0797891220', N'nbvc', NULL, 0, CAST(N'2020-03-25 10:19:39.803' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (33, NULL, N'quốc khánh', N'quockhanh@gmail.com', NULL, N'09425675809', N'WD', NULL, 0, CAST(N'2020-03-25 10:25:03.667' AS DateTime), NULL, NULL, N'42114')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (34, NULL, N'minh dương', N'quockhanh@gmail.com', NULL, N'09425675809', N'a qfgbnm,mh', NULL, 0, CAST(N'2020-03-25 10:34:55.673' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobi], [Content], [AttachmentFile], [Status], [CreateTime], [ApproveBy], [ContactCategoryID], [topic]) VALUES (35, NULL, N'minh dương', N'phatnaldo258vn@gmail.com', NULL, N'09425675809', N'asd', NULL, 0, CAST(N'2020-03-25 10:55:52.163' AS DateTime), NULL, NULL, N'Liên hệ hỏi đáp')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (1, NULL, 535000, N'quocminh258vn@gmail.com', N'Đào Quốc Khánh 1243t', N'2435467898', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 01:01:09.527' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (2, NULL, 535000, N'quocminh258vn@gmail.com', N'Đào Quốc Khánh 1243t', N'2435467898', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 01:01:14.300' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (3, NULL, 160000, N'user@gmail.com', N'True', N'2435467898', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 01:20:18.777' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (4, NULL, 165000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'098765432', N'0987654321', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:11:22.827' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (5, NULL, 165000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'098765432', N'0987654321', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 1, CAST(N'2020-04-12 04:11:51.943' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (6, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'23456543', N'4235674253', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:14:35.220' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (7, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:15:05.010' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (8, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:18:29.790' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (9, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:18:38.280' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (10, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'0987654321', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:20:53.127' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (11, NULL, 165000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:33:48.650' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (12, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'0987654321', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:34:27.043' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (13, NULL, 100000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:35:30.960' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (14, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:35:57.260' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (15, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:36:38.437' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (16, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'0987654321', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:38:04.420' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (17, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:40:53.350' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (18, NULL, 95000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 0, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:44:13.607' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (19, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'0987654321', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:44:33.677' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (20, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'0987654321', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:47:06.300' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (21, NULL, 30000, N'chuvanan258vn@gmail.com', N'khánh đẹp zai', N'2345', N'75463523456', N'BÌNH DƯƠNG', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 04:51:57.220' AS DateTime), 1)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (22, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'0987654321', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:46:03.273' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (23, NULL, 30000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:46:24.637' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (24, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:54:59.763' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (25, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:57:07.607' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (26, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:57:40.420' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (27, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:57:56.897' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (28, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, NULL, NULL, 1, 0, 0, CAST(N'2020-04-12 21:58:16.420' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (29, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, 1, NULL, 1, 0, 0, CAST(N'2020-04-12 22:32:17.733' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderID], [Code], [Total], [Email], [FullName], [Mobi], [Mobi2], [Address], [Gender], [PaymentMethod], [Comment], [OrderStatus], [DeliverStatus], [ChargeStatus], [CreateTime], [ClientID]) VALUES (30, NULL, 95000, N'khanh369vn@gmail.com', N'khánh', N'09876543131', N'75463523456', N'hóc môn', 1, 0, NULL, 1, 0, 0, CAST(N'2020-04-12 22:33:05.237' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 3, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 40, 2, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 42, 2, 30000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 57, 2, 150000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 3, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 40, 2, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 42, 2, 30000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 57, 2, 150000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 1, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 3, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 5, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 49, 1, 150000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (5, 49, 1, 150000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (7, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (8, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (9, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (10, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (11, 49, 1, 150000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (12, 1, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (13, 39, 1, 85000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (14, 1, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (15, 6, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (16, 7, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (17, 6, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (18, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (19, 5, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (20, 7, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (21, 6, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (22, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (23, 1, 1, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (24, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (25, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (26, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (27, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (28, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (29, 40, 1, 80000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (30, 40, 1, 80000)
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([PictureID], [Code], [Title], [Description], [Avatar], [Thumb], [Status], [Position], [CreateTime], [ViewTime], [CreateBy], [PictureCategoryID], [Link]) VALUES (3, NULL, N'Khu Vườn Tí Hon', N'Quà Tặng Độc Đáo', N'../FileUpload/image/trangbia/1.jpg', NULL, 1, NULL, NULL, NULL, N'admin', 2, NULL)
INSERT [dbo].[Picture] ([PictureID], [Code], [Title], [Description], [Avatar], [Thumb], [Status], [Position], [CreateTime], [ViewTime], [CreateBy], [PictureCategoryID], [Link]) VALUES (4, NULL, N'Hướng Dẫn Chăm Sóc', NULL, N'../FileUpload/image/trangbia/2.jpg', NULL, 1, NULL, NULL, NULL, N'admin', 2, NULL)
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[PictureCategory] ON 

INSERT [dbo].[PictureCategory] ([PictureCategoryID], [Code], [Title], [Description], [Avatar], [Thumb], [Status], [Position], [CreateTime], [ViewTime], [CreateBy], [PictureMainCategoryID]) VALUES (1, NULL, N'Main', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', 1)
INSERT [dbo].[PictureCategory] ([PictureCategoryID], [Code], [Title], [Description], [Avatar], [Thumb], [Status], [Position], [CreateTime], [ViewTime], [CreateBy], [PictureMainCategoryID]) VALUES (2, NULL, N'promotion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', 1)
SET IDENTITY_INSERT [dbo].[PictureCategory] OFF
SET IDENTITY_INSERT [dbo].[PictureMainCategory] ON 

INSERT [dbo].[PictureMainCategory] ([PictureMainCategoryID], [Code], [Title], [Description], [Avatar], [Thumb], [Status], [Position], [CreateTime], [ViewTime], [CreateBy]) VALUES (1, NULL, N'carousel', N'null', NULL, NULL, 1, NULL, NULL, NULL, N'Admin')
SET IDENTITY_INSERT [dbo].[PictureMainCategory] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (1, N'', N'Sen Dù Hồng 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/c735f5ed-8d72-4f2b-9112-2dac760e6b52.jpg', N'/FileUpload/image/Product/c735f5ed-8d72-4f2b-9112-2dac760e6b52.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 20:53:55.970' AS DateTime), N'Admin', 1, N'/FileUpload/image/sendacovua/img_4417_117f0c28237846178bc364c537604aaa_small1.jpg;/FileUpload/image/sendacovua/img_4277_7d1b859c0fe54fc6a48f705664413d63_small2.jpg;/FileUpload/image/sendacovua/img_3999_6c14d6c888184b3cb2f4630471e68638_small3.jpg;/FileUpload/image/sendacovua/img_3938_54895eeb80e845e294f8f605cbc23fab_small4.jpg;/FileUpload/image/sendacovua/img_2921_133c31b2b55f41d9a135b5f508af7a8c_small5.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (2, N'', N'Sen bèo tím 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/150cdf09-991f-4f00-840b-5323651383de.jpg', N'/FileUpload/image/Product/150cdf09-991f-4f00-840b-5323651383de.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:04:50.647' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (3, N'', N'Sen Rubi Hồng 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/81d89890-cdeb-45d7-a3dd-7b4898725f0d.jpg', N'/FileUpload/image/Product/81d89890-cdeb-45d7-a3dd-7b4898725f0d.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:04:50.647' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (4, N'', N'Sen Kim Lam 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/13455734-af55-453d-99a1-154b6ca957c7.jpg', N'/FileUpload/image/Product/13455734-af55-453d-99a1-154b6ca957c7.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:04:50.670' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (5, N'', N'Sen Đóa Hồng 2-3cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/84083482-bc29-4d1e-b5a8-250a65f8b79a.jpg', N'/FileUpload/image/Product/84083482-bc29-4d1e-b5a8-250a65f8b79a.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:04:50.670' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (6, N'', N'Sen SeDum Đen 2-3cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/b3357aa3-fce3-4ce8-941f-0b69106c7b65.jpg', N'/FileUpload/image/Product/b3357aa3-fce3-4ce8-941f-0b69106c7b65.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (7, N'', N'Sen Rubi Lá Ngắn (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/c0fdd96c-d6ed-4789-80de-bae367db38dd.jpg', N'/FileUpload/image/Product/c0fdd96c-d6ed-4789-80de-bae367db38dd.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (8, N'', N'Sen Kim Cương Trắng 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/7681289b-7cf4-48e2-8aea-9ec1f237c386.jpg', N'/FileUpload/image/Product/7681289b-7cf4-48e2-8aea-9ec1f237c386.jpg', NULL, 15000, 200000, N'20', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (9, N'', N'Sen mix 2 Loại Ngẫu Nhiên 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/23b69e85-ec2d-46d8-9158-244ce2c04d13.jpg', N'/FileUpload/image/Product/23b69e85-ec2d-46d8-9158-244ce2c04d13.jpg', NULL, 15000, 250000, N'25', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (10, N'', N'Sen Đất Hồng 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/c0d28608-8cc3-440b-86a6-f659b4a2bf7a.jpg', N'/FileUpload/image/Product/c0d28608-8cc3-440b-86a6-f659b4a2bf7a.jpg', NULL, 15000, 120000, N'12', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (11, N'', N'Sen Hoa Hồng Nâu 4-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/80d94d0a-3042-4067-bb14-b07d64b56e2d.jpg', N'/FileUpload/image/Product/80d94d0a-3042-4067-bb14-b07d64b56e2d.jpg', NULL, 15000, 220000, N'22', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpgFileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (12, N'', N'Sen Viềm Tím 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/4655b6ef-9c53-499a-9caf-17b94498d3c6.jpg', N'/FileUpload/image/Product/4655b6ef-9c53-499a-9caf-17b94498d3c6.jpg', NULL, 15000, 230000, N'23', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'FileUpload/image/no-image.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (13, N'', N'Sen Ngọc Bích 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/99ae588a-7725-4f5d-8d70-96db6ea37382.jpg', N'/FileUpload/image/Product/99ae588a-7725-4f5d-8d70-96db6ea37382.jpg', NULL, 15000, 420000, N'42', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (14, N'', N'Sen Liên Đài Trắng 3-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/10ad1cbb-b736-4c8b-bc75-2441384af3dc.jpg', N'/FileUpload/image/Product/10ad1cbb-b736-4c8b-bc75-2441384af3dc.jpg', NULL, 15000, 320000, N'32', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.673' AS DateTime), N'Admin', 1, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (15, N'', N'Sen Bánh Bao Xanh 4-5cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/fc754e1d-10a9-45cd-b7e4-520acc264281.jpg', N'/FileUpload/image/Product/fc754e1d-10a9-45cd-b7e4-520acc264281.jpg', NULL, 15000, 20000, N'', N'', N'', N'', 0, 1, 0, CAST(N'2020-03-16 21:04:50.677' AS DateTime), N'Admin', 1, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (16, N'', N'Sen Hoa Hồng Nâu 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/91b88be3-7ef9-411d-9c57-b279faeb85f3.jpg', N'/FileUpload/image/Product/91b88be3-7ef9-411d-9c57-b279faeb85f3.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.770' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (17, N'', N'Liên Đài Trắng 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/6c595998-7d5b-41cc-a99a-a2a58a8c89c7.jpg', N'/FileUpload/image/Product/6c595998-7d5b-41cc-a99a-a2a58a8c89c7.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.773' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (18, N'', N'Ngọc Bích Cỡ Vừa 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/45abcfaa-ee16-4e91-ae6a-0b0e42760162.jpg', N'/FileUpload/image/Product/45abcfaa-ee16-4e91-ae6a-0b0e42760162.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.773' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (19, N'', N'Ngọc Bích Cỡ Vừa 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/78281934-598e-4945-b926-6df238ecf90a.jpg', N'/FileUpload/image/Product/78281934-598e-4945-b926-6df238ecf90a.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.773' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (20, N'', N'Rubi Hồng 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/de2683fc-6c20-4b40-9a36-018db64b7ffc.jpg', N'/FileUpload/image/Product/de2683fc-6c20-4b40-9a36-018db64b7ffc.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.777' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (21, N'', N'Sen Bánh Bao Xanh 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/154a21e2-4358-43b2-873e-cf65816d3661.jpg', N'/FileUpload/image/Product/154a21e2-4358-43b2-873e-cf65816d3661.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.777' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (22, N'', N'Sen Bèo Tím 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/4a9454e0-5288-4104-8efb-92ab3e68ab51.jpg', N'/FileUpload/image/Product/4a9454e0-5288-4104-8efb-92ab3e68ab51.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.777' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (23, N'', N'Sen Đá Hồng Phấn 9-11cm (Bịch Nhựa/Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/076545c5-99df-4814-9a89-5b8233d0f255.jpg', N'/FileUpload/image/Product/076545c5-99df-4814-9a89-5b8233d0f255.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.777' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (24, N'', N'Sen Dạ Quang Bụi 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/477778ea-72ed-4cc7-8169-ba829bcfeba3.jpg', N'/FileUpload/image/Product/477778ea-72ed-4cc7-8169-ba829bcfeba3.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.780' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (25, N'', N'Sen Đất Hồng 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/e0fad2a3-e867-4710-bfa4-06d1ed68d4f6.jpg', N'/FileUpload/image/Product/e0fad2a3-e867-4710-bfa4-06d1ed68d4f6.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.780' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (26, N'', N'Sen Đất Trắng 9-11cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/b1de0438-f390-4367-8838-1fd84299f0bd.jpg', N'/FileUpload/image/Product/b1de0438-f390-4367-8838-1fd84299f0bd.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.780' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (27, N'', N'Sen Đôla Cỡ Vừa 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/93603149-d185-4c11-be2f-a31dd8af91d1.jpg', N'/FileUpload/image/Product/93603149-d185-4c11-be2f-a31dd8af91d1.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.780' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (28, N'', N'Sen Đôla Cỡ Vừa 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/fbd69417-6b9c-454c-90df-dc1476e88c5c.jpg', N'/FileUpload/image/Product/fbd69417-6b9c-454c-90df-dc1476e88c5c.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.780' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (29, N'', N'Sen Kim Cương Trắng 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/ceba1fa8-acef-46d9-8bea-5a0075894f1b.jpg', N'/FileUpload/image/Product/ceba1fa8-acef-46d9-8bea-5a0075894f1b.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.783' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (30, N'', N'Sen Kim Cương Trắng 9-11cm (Chậu Nhựa/Bịch Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/Product/105f4a70-e716-4c95-8e40-92533b096e05.jpg', N'/FileUpload/image/Product/105f4a70-e716-4c95-8e40-92533b096e05.jpg', NULL, 35000, 40000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:20:44.783' AS DateTime), N'Admin', 2, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', N'')
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (31, NULL, N'Sen Xanh Bụi Lớn (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_SenDaxanhbuilon.jpg', N'', NULL, 200000, 250000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:25.143' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (32, NULL, N'Sen Thơm Cỡ Lớn (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/Senthom.jpg', N'', NULL, 200000, 250000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:25.390' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (33, NULL, N'Sen Đá Đỏ Bụi Lớn (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_SenDaodobuilon.jpg', N'', NULL, 200000, 250000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:26.120' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (34, NULL, N'Sen Đá Xanh Bụi Lớn (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_SenXanhBuiLon.jpg', N'', NULL, 200000, 250000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:26.167' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (35, NULL, N'Sen Rubi Hồng Cỡ Lớn 11-13cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_Senrubicolon_11-13cm.jpg', N'', NULL, 80000, 150000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:26.220' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (36, NULL, N'Sen Bánh Bao Xanh Cỡ Đại 13-15cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_SenBanhBaoXanh_13-15cm.jpg', N'', NULL, 200000, 350000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:26.263' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (37, NULL, N'Sen Đất Xanh Cỡ Lớn 11-13cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/SenDaBn/SenDaCoLon/img_SenDatxanh_11-13cm.jpg', N'', NULL, 80000, 150000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:28:26.307' AS DateTime), N'admin', 3, N'/FileUpload/image/no_image0.png;/FileUpload/image/no_image1.png;/FileUpload/image/no_image2.png;/FileUpload/image/no_image3.png;/FileUpload/image/no_image4.png;/FileUpload/image/no_image5.png;
', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (38, NULL, N'Xương Rồng Tai Thỏ (Bịch Nhựa/Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/XuongRong/img_XuongRongTaitho.jpg', N'', NULL, 18000, 20000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:34:53.490' AS DateTime), N'admin', 4, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (39, NULL, N'Xương Rồng Thần Long 7-9cm (Chậu Nhựa)', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/XuongRong/img_XuongRongThanLong_7-9cm.jpg', N'', NULL, 85000, 90000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:34:53.490' AS DateTime), N'admin', 4, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (40, NULL, N'Xương Rồng Xanh', N'Chưa có mô tả cho sản phẩm này', N'/FileUpload/image/SenDaBD/XuongRong/img_XuongRongXanh.jpg', N'', NULL, 80000, 20000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:34:53.490' AS DateTime), N'admin', 4, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (41, NULL, N'Xương Rồng Trứng Chim (Bịch Nhựa/Chậu Nhựa)', N'', N'/FileUpload/image/SenDaBD/XuongRong/img_XuongRongTrungChim.jpg', N'', NULL, 25000, 20000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:34:53.490' AS DateTime), N'admin', 4, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (42, NULL, N'Xương Rồng Trứng Chim', N'', N'/FileUpload/image/SenDaBD/XuongRong/img_XuongRongTrungchim25k.jpg', N'', NULL, 30000, 20000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:34:53.490' AS DateTime), N'admin', 4, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (43, NULL, N'Trầu Bà Cẩm Thạch', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_TrauBaCamThach.jpg', N'', NULL, 112000, 120000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.293' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (44, NULL, N'Cỏ Đồng Tiền Cỡ Vừa', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_CoDongtien.jpg', N'', NULL, 820000, 132000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.293' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (45, NULL, N'Vạn Lộc Cây Đơn', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_vanLocCayDon.jpg', N'', NULL, 112000, 180000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.293' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (46, NULL, N'Tùng Bồng Lai', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_TungBongLai.jpg', N'', NULL, 112000, 180000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.293' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (47, NULL, N'Phú Quý', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_PhuQuy.jpg', N'', NULL, 190000, 112000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.297' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (48, NULL, N'Vạn Lộc Bụi', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_vanLocbui.jpg', N'', NULL, 120000, 112000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.297' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (49, NULL, N'Trường Sinh Sọc Vàng', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_TruongSinhSocVang.jpg', N'', NULL, 150000, 112000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.297' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (50, NULL, N'Trầu Bà Vàng', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_TrauBaVang.jpg', N'', NULL, 80000, 112000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.300' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (51, NULL, N'Trường Sinh Cẩm Thạch', N'', N'/FileUpload/image/SenDaBD/CayTrongVP/img_TruongSinhCamThach.jpg', N'', NULL, 190000, 112000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 21:52:07.300' AS DateTime), N'admin', 5, N'/FileUpload/image/no_image0.png;/image/no_image1.png;/image/no_image2.png;/image/no_image3.png;/image/no_image4.png;/image/no_image5.png;', NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (52, NULL, N'Tiểu Cảnh Chậu Trụ MS 05', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chautru05.jpg', N'', NULL, 200000, 212000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.123' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (53, NULL, N'Tiểu Cảnh Chậu Trụ MS 04', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chautru04.jpg', N'', NULL, 200000, 212000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (54, NULL, N'Tiểu Cảnh Chậu Trụ MS 03', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chautru03.jpg', N'', NULL, 200000, 212000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (55, NULL, N'Tiểu Cảnh Chậu Vuông Ms 17', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong17.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (56, NULL, N'Tiểu Cảnh Chậu Vuông Ms 16', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong16.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (57, NULL, N'Tiểu Cảnh Chậu Vuông Ms 15', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong15.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (58, NULL, N'Tiểu Cảnh Chậu Vuông Ms 14', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong14.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.127' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (59, NULL, N'Tiểu Cảnh Chậu Vuông Ms 13', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong13.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (60, NULL, N'Tiểu Cảnh Chậu Vuông Ms 12', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong12.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (61, NULL, N'Tiểu Cảnh Chậu Vuông Ms 11', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong11.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (62, NULL, N'Tiểu Cảnh Chậu Vuông Ms 10', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong10.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (63, NULL, N'Tiểu Cảnh Chậu Vuông Ms 09', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong09.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (64, NULL, N'Tiểu Cảnh Chậu Vuông Ms 08', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chauvuong08.jpg', N'', NULL, 150000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (65, NULL, N'Sen Đá Mix Chậu Trụ Ms 02', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chautrumix02.jpg', N'', NULL, 200000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (66, NULL, N'Sen Đá Mix Chậu Trụ Ms 01', N'', N'/FileUpload/image/SenDaBD/TieuCanh/img_chautrumix01.jpg', N'', NULL, 200000, 122000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:04:52.130' AS DateTime), N'admin', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (67, NULL, N'Chậu Đất Nung Đỏ Mini 5x5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDoMiNi_5x5cm.jpg', N'', NULL, 6000, 5500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.910' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (68, NULL, N'Chậu Đất Nung Đỏ 17x9cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_17x9cm.jpg', N'', NULL, 30000, 29000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.910' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (69, NULL, N'Chậu Đất Nung Đỏ 14x7cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_14x7cm.jpg', N'', NULL, 20000, 19000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.910' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (70, NULL, N'Chậu Đất Nung Đỏ 13x13cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_13x13cm.jpg', N'', NULL, 20000, 19000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.910' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (71, NULL, N'Chậu Đất Nung Đỏ 11x11cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_11x11cm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.913' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (72, NULL, N'
Chậu Đất Nung Đỏ 9x9cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_9x9cm.jpg', N'', NULL, 16000, 14500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.913' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (73, NULL, N'Chậu Đất Nung Đỏ 7.5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_7,5cm.jpg', N'', NULL, 10000, 9500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.913' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (74, NULL, N'Chậu Đất Nung Đỏ Trụ 8x8cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungDo_8x8cm.jpg', N'', NULL, 16000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.917' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (75, NULL, N'Đế Lót Chậu Đỏ Lớn 14cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauDoLon_14cm.jpg', N'', NULL, 16000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.920' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (76, NULL, N'Đế Lót Đất Nung Đỏ Vừa 11cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauDoVua_111cm.jpg', N'', NULL, 10000, 9500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.920' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (77, NULL, N'Đế lót đất nung đỏ nhỏ 8cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauDoNho_8cm.jpg', N'', NULL, 6000, 5500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:20:25.920' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (78, NULL, N'Chậu Đất Nung Trắng 17x9cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauNungtrang_17x9cmcm.jpg', N'', NULL, 30000, 29000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.647' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (79, NULL, N'Chậu Đất Nung Trắng 14x7cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauDatNungTrang_14x7cm.jpg', N'', NULL, 20000, 19000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.647' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (80, NULL, N'Chậu Đất Nung Trắng 13x13cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauDatNungTrang_13x13cm.jpg', N'', NULL, 20000, 19000, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.670' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (81, NULL, N'Chậu Đất Nung Trắng 11x11cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauDatNungTrang_11x11cm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.670' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (82, NULL, N'
Chậu Đất Nung Trắng 9x9cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauDatNungTrang_9x9cm.jpg', N'', NULL, 16000, 14500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.670' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (83, NULL, N'Chậu Đất Nung Trắng 7.5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_ChauDatNungTrang_7x5cm.jpg', N'', NULL, 10000, 9500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.670' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (84, NULL, N'Đế Lót Chậu Trắng Lớn 14cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauTrangLon_14cm.jpg', N'', NULL, 16000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.673' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (85, NULL, N'Đế Lót Đất Nung Trắng Vừa 11cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauTrangLon_11cm.jpg', N'', NULL, 10000, 9500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.673' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (86, NULL, N'Đế lót đất nung Trắng nhỏ 8cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauDatNung/img_DeLotChauTrangNho_8cm.jpg', N'', NULL, 6000, 5500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:27:29.673' AS DateTime), N'admin', 7, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (87, NULL, N'
Đế Lót Sứ Tròn Nhỏ 8cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_DeLotSuTronNho_8cm.jpg', N'', NULL, 8000, 5500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.107' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (88, NULL, N'
Chậu Trứng Hình Mini - 8x8cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauTrungHinhMiNi_8x8cm.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.107' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (89, NULL, N'
Chậu Loe 7x7cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauLoe7x7cm.jpg', N'', NULL, 25000, 23500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.107' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (90, NULL, N'
Chậu Mắt Na Hình 7x7cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauMatNaHinh_7x7cm.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.110' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (91, NULL, N'
Chậu Cúp Miệng Hình 8x6cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauSuMiengLoejpg.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.110' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (92, NULL, N'
Chậu Trứng 11x11cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauTrung_11x11cm.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.110' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (93, NULL, N'
Chậu Vuông Hình 9.5x9.5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauVuongHinh_9.5x9.5cm.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.113' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (94, NULL, N'
Chậu Trụ Hình 12x10cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauTruHinh_12x10cm.jpg', N'', NULL, 58000, 55500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (95, NULL, N'
Chậu Trụ Thấp Bộ 3 Cái', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauTru3bocai.jpg', N'', NULL, 128000, 125500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (96, NULL, N'
Đế Lót Sứ Vuông', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_DeLotSuVuong_9.5x9.5cm.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (97, NULL, N'
Đế Lót Sứ Tròn 12cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_DeLotSuTron_12cm.jpg', N'', NULL, 15000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (98, NULL, N'
Chậu Vuông Hồng', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauVuongHong.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (99, NULL, N'
Chậu Man Trắng 12.5x12.5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_ChauMangTrang_12.5x12.5cm.jpg', N'', NULL, 38000, 35500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
GO
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (100, NULL, N'
Chậu Man Trắng 14.5x14.5cm', N'', N'/FileUpload/image/SenDaBD/ChauTrongCay/ChauSu/img_DeLotSuVuong_14.5x14.5cm.jpg', N'', NULL, 40000, 35500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:45:28.117' AS DateTime), N'admin', 8, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (101, NULL, N'Ông Bà Lão Ngồi', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Ongbalaongoi.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.530' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (102, NULL, N'Ông Bà Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Ongbamini.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.530' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (103, NULL, N'Tổ Chim', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Tochim.jpg', N'', NULL, 38000, 35500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.530' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (104, NULL, N'Xe Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_XeTaiMiNi .jpg', N'', NULL, 58000, 55500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.583' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (105, NULL, N'Ông Bà Lão Ao Len', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/imgOngBalaoaolen_.jpg', N'', NULL, 128000, 125500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.583' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (106, NULL, N'Nhím Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Nhimmini.jpg', N'', NULL, 28000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.623' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (107, NULL, N'Cối Xay Gió', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Cooxaygio.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.623' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (108, NULL, N'Cối Xay Gió', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Cooxaygio.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.673' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (109, NULL, N'Cột Đèn Cao', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_CotDenCao.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.673' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (110, NULL, N'Cột Đèn Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_CotDenMini.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.673' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (111, NULL, N'Chó Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Chomini.jpg', N'', NULL, 18000, 25500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.673' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (112, NULL, N'Chó Giữ Nhà', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Chogiunha.jpg', N'', NULL, 28000, 35500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.730' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (113, NULL, N'Ếch Mi Ni', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Echmini.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.733' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (114, NULL, N'Gấu PaDa', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Gaupada.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.780' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (115, NULL, N'Ghế Trắng', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_ghetrang.jpg', N'', NULL, 48000, 55500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.783' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (116, NULL, N'Hàng Rào Màu', N'', N'/FileUpload/image/SenDaBD/PKTranngTri/img_Hangraomau.jpg', N'', NULL, 18000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 22:58:29.783' AS DateTime), N'admin', 9, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (117, NULL, N'Đất Trồng Sen Đá (1 Kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_DatTrongSenDa.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.493' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (118, NULL, N'Hỗn Hợp Tro Trấu (1 Kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_honHopTroTrau.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.493' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (121, NULL, N'Sỏi Ba Màu 3-5mm (1kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_Soibamau_3-5mm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.520' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (122, NULL, N'Sỏi Trắng 1 - 1.5cm (1kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_SoiTrang_1-5cm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.520' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (123, NULL, N'Sỏi Trắng 2-3cm (1kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_SoiTrang_2-3cm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.520' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (125, NULL, N'
Sỏi Xám Xanh 5-10mm (1kg)', N'', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_SoiXamxanh_5-10mm.jpg', N'', NULL, 20000, 15500, N'', N'', N'', N'', 99, 1, 0, CAST(N'2020-03-16 23:06:16.520' AS DateTime), N'admin', 10, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Dercription], [Avatar], [Thumb], [ViewTime], [Price], [OldPrice], [Promotions], [WarrantyPolicy], [Specifications], [Accessories], [Quantity], [Status], [Position], [CreateTime], [CreateBy], [ProductCategoryID], [ImagesList], [Content]) VALUES (126, N'', N'Thuốc Tím Trị Rệp (50g)', N'Thuốc Tím Trị Rệp (50g)', N'/FileUpload/image/SenDaBD/DatTrongPhanBon/img_thuoctimtrirep.jpg', N'', NULL, 15500, 20000, N'', N'', N'', N'', 99, 1, 126, CAST(N'2020-03-16 23:06:16.523' AS DateTime), N'Admin', 10, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (1, N'', N'Sen đá cỡ nhỏ', N'Sen đá cỡ nhỏ', N'/FileUpload/image/ProductCategory/4cd4cbcf-b99c-4667-9619-ffae8de77493.png', N'/FileUpload/image/ProductCategory/4cd4cbcf-b99c-4667-9619-ffae8de77493.png', 1, 1, NULL, N'Admin', 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (2, N'', N'Sen đá cỡ vừa', N'Sen đá cỡ vừa', N'/FileUpload/image/ProductCategory/a1e8dfac-56ab-463c-bd58-1c9d0c3a074b.png', N'/FileUpload/image/ProductCategory/a1e8dfac-56ab-463c-bd58-1c9d0c3a074b.png', 1, 2, NULL, N'Admin', 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (3, N'', N'Sen đá cỡ lớn', N'Sen đá cỡ lớn', N'/FileUpload/image/ProductCategory/06a1fd64-904e-4630-a92b-96ab1a9ac8dd.png', N'/FileUpload/image/ProductCategory/06a1fd64-904e-4630-a92b-96ab1a9ac8dd.png', 1, 3, NULL, N'Admin', 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (4, N'', N'Xương rồng', N'Xương rồng', N'/FileUpload/image/ProductCategory/f64503be-a7a4-4fa1-ba27-db2268f39175.png', N'/FileUpload/image/ProductCategory/f64503be-a7a4-4fa1-ba27-db2268f39175.png', 1, 1, NULL, N'Admin', 2)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (5, N'', N'Cây trồng văn phòng', N'Cây trồng văn phòng', N'/FileUpload/image/ProductCategory/bb6f55d4-0808-49f0-b168-f1ac796aaffc.png', N'/FileUpload/image/ProductCategory/bb6f55d4-0808-49f0-b168-f1ac796aaffc.png', 1, 5, NULL, N'Admin', 3)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (6, N'', N'Tiểu cảnh', N'Tiểu cảnh', N'/FileUpload/image/ProductCategory/1f599c64-8099-45f5-a0ff-6eb089cf6d66.png', N'/FileUpload/image/ProductCategory/1f599c64-8099-45f5-a0ff-6eb089cf6d66.png', 1, 1, NULL, N'Admin', 4)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (7, N'', N'Chậu đất nung', N'Chậu đất nung', N'/FileUpload/image/ProductCategory/0cab16eb-1319-47f4-9ca5-a9ed1dedee7b.png', N'/FileUpload/image/ProductCategory/0cab16eb-1319-47f4-9ca5-a9ed1dedee7b.png', 1, 1, NULL, N'Admin', 5)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (8, N'', N'Chậu sứ', N'Chậu sứ', N'/FileUpload/image/ProductCategory/f05959cc-3b9e-4018-ad27-eb902247b01a.png', N'/FileUpload/image/ProductCategory/f05959cc-3b9e-4018-ad27-eb902247b01a.png', 1, 1, NULL, N'Admin', 5)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (9, N'', N'Phụ kiện', N'Phụ kiện', N'/FileUpload/image/ProductCategory/825a19f9-1958-4c29-b305-22549d91bcc5.png', N'/FileUpload/image/ProductCategory/825a19f9-1958-4c29-b305-22549d91bcc5.png', 1, 1, NULL, N'Admin', 6)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (10, N'', N'Đất trồng', N'Đất trồng', N'/FileUpload/image/ProductCategory/97469106-b33a-40dc-968a-26f0a36c99f9.png', N'/FileUpload/image/ProductCategory/97469106-b33a-40dc-968a-26f0a36c99f9.png', 1, 1, NULL, N'Admin', 7)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductMainCategory] ON 

INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (1, N'', N'Sen đá bịch/chậu nhựa', N'Sen đá bịch/chậu nhựa', N'/FileUpload/image/ProductMainCategory/69c59ed0-789c-46c8-afa3-11cd51a3601d.png', N'/FileUpload/image/ProductMainCategory/69c59ed0-789c-46c8-afa3-11cd51a3601d.png', 1, 1, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (2, N'', N'Xương rồng', N'Xương rồng', N'/FileUpload/image/ProductMainCategory/848b6737-ba97-41f9-902e-1b66869686bb.png', N'/FileUpload/image/ProductMainCategory/848b6737-ba97-41f9-902e-1b66869686bb.png', 1, 2, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (3, N'', N'Cây trồng văn phòng', N'Cây trồng văn phòng', N'/FileUpload/image/ProductMainCategory/44ecf160-3390-465d-83ff-ea7ce218f528.png', N'/FileUpload/image/ProductMainCategory/44ecf160-3390-465d-83ff-ea7ce218f528.png', 1, 3, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (4, N'', N'Tiểu cảnh trang trí', N'Tiểu cảnh trang trí', N'/FileUpload/image/ProductMainCategory/f4cb9f4e-4aae-47e6-a549-418619b25b01.png', N'/FileUpload/image/ProductMainCategory/f4cb9f4e-4aae-47e6-a549-418619b25b01.png', 1, 4, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (5, N'', N'Chậu cây trồng', N'Chậu cây trồng', N'/FileUpload/image/ProductMainCategory/eb3db800-cfc9-4d57-9347-0f2830f5b5af.png', N'/FileUpload/image/ProductMainCategory/eb3db800-cfc9-4d57-9347-0f2830f5b5af.png', 1, 5, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (6, N'', N'Phụ kiện', N'Phụ kiện', N'/FileUpload/image/ProductMainCategory/b351a866-71f0-405e-bf88-8648e387ba8d.png', N'/FileUpload/image/ProductMainCategory/b351a866-71f0-405e-bf88-8648e387ba8d.png', 1, 6, NULL, N'Admin')
INSERT [dbo].[ProductMainCategory] ([ProductMainCategoryID], [Code], [Title], [Dercription], [Avatar], [Thumb], [Status], [Position], [CreateTime], [CreateBy]) VALUES (7, N'', N'Đất trồng', N'Đất trồng', N'/FileUpload/image/ProductMainCategory/242fec52-5904-4f26-af2d-e4215d18a936.png', N'/FileUpload/image/ProductMainCategory/242fec52-5904-4f26-af2d-e4215d18a936.png', 1, 7, NULL, N'Admin')
SET IDENTITY_INSERT [dbo].[ProductMainCategory] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountCategory] FOREIGN KEY([AccountCategoryID])
REFERENCES [dbo].[AccountCategory] ([AccountCategoryID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountCategory]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Account]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategory] FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategory] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategory]
GO
ALTER TABLE [dbo].[ArticleCategory]  WITH CHECK ADD  CONSTRAINT [FK_ArticleCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ArticleCategory] CHECK CONSTRAINT [FK_ArticleCategory_Account]
GO
ALTER TABLE [dbo].[ArticleCategory]  WITH CHECK ADD  CONSTRAINT [FK_ArticleCategory_ArticleMainCategory] FOREIGN KEY([ArticleMainCategoryID])
REFERENCES [dbo].[ArticleMainCategory] ([ArticleMainCategoryID])
GO
ALTER TABLE [dbo].[ArticleCategory] CHECK CONSTRAINT [FK_ArticleCategory_ArticleMainCategory]
GO
ALTER TABLE [dbo].[ArticleMainCategory]  WITH CHECK ADD  CONSTRAINT [FK_ArticleMainCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ArticleMainCategory] CHECK CONSTRAINT [FK_ArticleMainCategory_Account]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Account] FOREIGN KEY([ApproveBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Account]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientCategory] FOREIGN KEY([ClientCategoryID])
REFERENCES [dbo].[ClientCategory] ([ClientCategoryID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_ClientCategory]
GO
ALTER TABLE [dbo].[ClientCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClientCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ClientCategory] CHECK CONSTRAINT [FK_ClientCategory_Account]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([ApproveBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactCategory] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactCategory]
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ContactCategory] CHECK CONSTRAINT [FK_ContactCategory_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Account]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_PictureCategory] FOREIGN KEY([PictureCategoryID])
REFERENCES [dbo].[PictureCategory] ([PictureCategoryID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_PictureCategory]
GO
ALTER TABLE [dbo].[PictureCategory]  WITH CHECK ADD  CONSTRAINT [FK_PictureCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[PictureCategory] CHECK CONSTRAINT [FK_PictureCategory_Account]
GO
ALTER TABLE [dbo].[PictureCategory]  WITH CHECK ADD  CONSTRAINT [FK_PictureCategory_PictureMainCategory] FOREIGN KEY([PictureMainCategoryID])
REFERENCES [dbo].[PictureMainCategory] ([PictureMainCategoryID])
GO
ALTER TABLE [dbo].[PictureCategory] CHECK CONSTRAINT [FK_PictureCategory_PictureMainCategory]
GO
ALTER TABLE [dbo].[PictureMainCategory]  WITH CHECK ADD  CONSTRAINT [FK_PictureMainCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[PictureMainCategory] CHECK CONSTRAINT [FK_PictureMainCategory_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Account]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_ProductMainCategory] FOREIGN KEY([ProductMainCategoryID])
REFERENCES [dbo].[ProductMainCategory] ([ProductMainCategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_ProductMainCategory]
GO
ALTER TABLE [dbo].[ProductMainCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductMainCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ProductMainCategory] CHECK CONSTRAINT [FK_ProductMainCategory_Account]
GO
