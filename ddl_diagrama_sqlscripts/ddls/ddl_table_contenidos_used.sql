USE [platforms_database]
GO
/****** Object:  Table [dbo].[contenidos]    Script Date: 4/13/2022 11:45:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contenidos](
	[content_id] [varchar](50) NOT NULL,
	[platform_name] [varchar](40) NOT NULL,
	[title] [varchar](250) NOT NULL,
	[type] [varchar](5) NULL,
	[director] [varchar](50) NULL,
	[cast] [varchar](max) NULL,
	[country] [varchar](100) NULL,
	[date_added] [date] NULL,
	[year] [int] NULL,
	[rating] [varchar](20) NULL,
	[duration] [int] NULL,
	[genres] [varchar](250) NULL,
	[description] [text] NULL,
	[seasons] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
