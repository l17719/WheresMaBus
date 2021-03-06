USE [WMBDB]
GO
/****** Object:  Table [dbo].[Paragens]    Script Date: 12/06/2014 14:38:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paragens]') AND type in (N'U'))
DROP TABLE [dbo].[Paragens]
GO
/****** Object:  Table [dbo].[Paragens]    Script Date: 12/06/2014 14:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paragens]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[Paragens] ON
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'7b81dd78-2212-4ba5-9786-11d21723e50d', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5737883, -7.9096002999999646, N'Rua da Corredoura', 21)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'13aca6e3-246b-413d-bc5e-125d33fa78ef', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5706994, -7.9119794000000638, N'Rua de Serpa Pinto, Evora', 13)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'996212e8-3a26-45ae-8fc5-251b47c7b0b3', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5665979, -7.9056627999999582, N'Rossio Sao Bras', 12)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'3c0d597a-67b7-4f95-933d-25d1ea28f516', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5719461, -7.9155312999999987, N'Avenida Lisboa', 14)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'8b0b078c-046a-4b3f-8354-2655c184a1e9', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5736278, -7.9062404000000015, N'Rampa Seminario Largo Colegiais', 18)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'70dfa1d0-757d-4f20-8c99-30433e45355f', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5747516, -7.901795399999969, N'Rua Doutor Domingos Rosado', 19)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'b03348fc-b66f-446c-8918-32b4b636b07b', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5689513, -7.9032412999999906, N'Hospital Patrocinio', 4)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'b73ca4aa-bde1-4768-850b-34bf5efb654d', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5744402, -7.9129516000000413, N'Porta Nova Rua Candido Reis', 16)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'42d8ee2b-12d8-46d2-b063-471bc8c5b544', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.570941, -7.9093789999999444, N'Praça Giraldo', 11)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'38efe78e-00ed-41b3-9625-4e98d5e0ddaf', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5701901, -7.9015362999999743, N'Avenida S. Joao Deus', 5)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'4e2e6cc7-1843-40dd-a3c9-812ea9287521', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5720499, -7.9034381000000158, N'Rua Machede', 6)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'8c166b6a-17fc-459a-9c9d-8c3d74208225', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5691873, -7.904356900000038, N'Portas de moura, Rua Dom Augusto Eduardo Nunes', 7)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'1c5923d8-7f70-4803-8a12-984885124ec9', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5664284, -7.9026410000000178, N'Chafariz del Rei', 3)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'545f8f37-9aeb-444d-92ca-aaef68f9ddf4', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.574747, -7.9163912000000209, N'Horta da Porta', 15)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'c51b5f23-e2a3-47a3-aae7-b43641f15f18', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5739458, -7.9032095999999683, N'Avenida da Universidade', 20)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'f881dcb6-1611-4fd6-9c3d-cb334b47e435', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5689513, -7.9032412999999906, N'Hospital Espirito Santo', 8)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'bfc172b9-3582-419c-b971-cf1908933b68', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5748003, -7.909974899999952, N'Rua de Aviz', 22)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'e4e6dcd8-bca9-421d-a4a4-d5c396883ee5', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5733317, -7.9089307000000417, N'Rua Menino Jesus', 17)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'8f08b921-73bc-4f6f-9542-d94da3ec11ed', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.562692, -7.9062516999999843, N'Av Combatentes', 2)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'93fd7c93-f518-4503-aaec-d953a3b34f58', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5693596, -7.9082769999999982, N'Rua Republica', 10)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'7219c8d1-08ea-4691-a7fe-e6ab1927f08e', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5690676, -7.9175302999999539, N'Avenida de São Sebastião', 23)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'b2c1f871-f44a-4063-9f78-ed50bbf000cf', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5706994, -7.9119794000000638, N'Rua de Serpa Pinto, Evora', 12)
INSERT [dbo].[Paragens] ([stamp], [stampLinha], [latitude], [longitude], [NomeParagem], [Ordem]) VALUES (N'451cf7e2-9c1b-4e86-8c84-f71a5903a814', N'41297aff-fa85-4194-a3fd-a2e52606b04c', 38.5653476, -7.909456999999974, N'Av Dinis Miranda', 1)
SET IDENTITY_INSERT [dbo].[Paragens] OFF
