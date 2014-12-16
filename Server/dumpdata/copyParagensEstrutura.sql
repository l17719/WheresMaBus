USE [WMBDB]
GO

/****** Object:  Table [dbo].[Paragens]    Script Date: 12/06/2014 14:35:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Paragens](
	[stamp] [uniqueidentifier] NOT NULL,
	[stampLinha] [uniqueidentifier] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[NomeParagem] [nvarchar](max) NOT NULL,
	[Ordem] [int]  NOT NULL,
 CONSTRAINT [PK_Paragens] PRIMARY KEY CLUSTERED 
(
	[stamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

