USE [platforms_database]
GO
/****** Object:  Table [dbo].[contenidos]    Script Date: 4/12/2022 9:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contenidos](
	[content_id] [varchar](50) NOT NULL,
	[platform_id] [int] NULL,
	[title] [varchar](250) NOT NULL,
	[type] [varchar](5) NULL,
	[director] [varchar](50) NULL,
	[cast] [varchar](max) NULL,
	[country_id] [int] NULL,
	[date_added] [date] NULL,
	[year] [int] NULL,
	[rating] [varchar](20) NULL,
	[duration] [int] NULL,
	[genres] [varchar](250) NULL,
	[description] [text] NULL,
	[seasons] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 4/12/2022 9:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alpha2_iso_code] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[alpha2_iso_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plataformas]    Script Date: 4/12/2022 9:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plataformas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[paises] ([id])
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD FOREIGN KEY([platform_id])
REFERENCES [dbo].[plataformas] ([id])
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD  CONSTRAINT [CK_contenido_year] CHECK  (([year]<=datepart(year,getdate()) AND [year]>=(1800)))
GO
ALTER TABLE [dbo].[contenidos] CHECK CONSTRAINT [CK_contenido_year]
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD  CONSTRAINT [CK_date_added] CHECK  (([date_added]<=format(getdate(),'yyyy-MM-dd')))
GO
ALTER TABLE [dbo].[contenidos] CHECK CONSTRAINT [CK_date_added]
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD  CONSTRAINT [CK_duration] CHECK  (([duration]>(0)))
GO
ALTER TABLE [dbo].[contenidos] CHECK CONSTRAINT [CK_duration]
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD  CONSTRAINT [CK_seasons] CHECK  (([seasons]>(0)))
GO
ALTER TABLE [dbo].[contenidos] CHECK CONSTRAINT [CK_seasons]
GO
ALTER TABLE [dbo].[contenidos]  WITH CHECK ADD  CONSTRAINT [CK_tipos] CHECK  (([type]='serie' OR [type]='movie'))
GO
ALTER TABLE [dbo].[contenidos] CHECK CONSTRAINT [CK_tipos]
GO
