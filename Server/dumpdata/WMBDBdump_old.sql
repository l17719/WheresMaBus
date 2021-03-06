USE [master]
GO
/****** Object:  Database [WMBDB]    Script Date: 12/06/2014 15:05:30 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'WMBDB')
BEGIN
CREATE DATABASE [WMBDB] ON  PRIMARY 
( NAME = N'WMBDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\WMBDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WMBDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\WMBDB_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [WMBDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WMBDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WMBDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [WMBDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [WMBDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [WMBDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [WMBDB] SET ARITHABORT OFF
GO
ALTER DATABASE [WMBDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [WMBDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [WMBDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [WMBDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [WMBDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [WMBDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [WMBDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [WMBDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [WMBDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [WMBDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [WMBDB] SET  ENABLE_BROKER
GO
ALTER DATABASE [WMBDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [WMBDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [WMBDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [WMBDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [WMBDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [WMBDB] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [WMBDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [WMBDB] SET  READ_WRITE
GO
ALTER DATABASE [WMBDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [WMBDB] SET  MULTI_USER
GO
ALTER DATABASE [WMBDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [WMBDB] SET DB_CHAINING OFF
GO
USE [WMBDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/06/2014 15:05:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[BusInfo]    Script Date: 12/06/2014 15:05:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BusInfo]') AND type in (N'U'))
DROP TABLE [dbo].[BusInfo]
GO
/****** Object:  Table [dbo].[dadosLinha]    Script Date: 12/06/2014 15:05:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dadosLinha]') AND type in (N'U'))
DROP TABLE [dbo].[dadosLinha]
GO
/****** Object:  Table [dbo].[Paragens]    Script Date: 12/06/2014 15:05:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paragens]') AND type in (N'U'))
DROP TABLE [dbo].[Paragens]
GO
/****** Object:  Table [dbo].[Paragens]    Script Date: 12/06/2014 15:05:32 ******/
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
	[Ordem] [int] NOT NULL,
 CONSTRAINT [PK_Paragens] PRIMARY KEY CLUSTERED 
(
	[stamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
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
/****** Object:  Table [dbo].[dadosLinha]    Script Date: 12/06/2014 15:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dadosLinha]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dadosLinha](
	[stamp] [uniqueidentifier] NOT NULL,
	[nomeLinha] [nvarchar](50) NOT NULL,
	[stampLinha] [float] NOT NULL,
	[NomeParagem] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
 CONSTRAINT [PK_dbo.dadosLinha] PRIMARY KEY CLUSTERED 
(
	[stamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[dadosLinha] ([stamp], [nomeLinha], [stampLinha], [NomeParagem], [latitude], [longitude]) VALUES (N'41297aff-fa85-4194-a3fd-a2e52606b04c', N'LinhaAzul', 38.5653476, -7.9094569999999749, 38.5690676, -7.9175302999999531)
/****** Object:  Table [dbo].[BusInfo]    Script Date: 12/06/2014 15:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BusInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BusInfo](
	[stamp] [uniqueidentifier] NOT NULL,
	[latbusposition] [float] NOT NULL,
	[longbusposition] [float] NOT NULL,
	[dataHoraBus] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BusInfo] PRIMARY KEY CLUSTERED 
(
	[stamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'dde974bf-db46-45a1-b7fc-015ebd00b9e7', 38.5653476, -7.9094569999999749, CAST(0x0000A3E001870261 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'c0dcdbe5-5a38-4155-a5ee-02eebad1953c', 38.5664284, -7.9026410000000169, CAST(0x0000A3E00189C1C0 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'82c2ef40-9df3-462a-a821-034bb9120b2a', 38.570941, -7.9093789999999444, CAST(0x0000A3E0017527D8 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'c075a543-0acb-4b5f-8071-04c2bfee7fa8', 38.5691873, -7.9043569000000389, CAST(0x0000A3DC00FB431F AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'1e029feb-9e8a-4172-af4b-055207dd2375', 38.5690676, -7.9175302999999531, CAST(0x0000A3DC010A0F8B AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7fe9047b-acfe-421f-bef4-08ebdeaf04d6', 38.5706994, -7.9119794000000638, CAST(0x0000A3E00128C46D AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5c14c37b-539b-4d57-9eb1-09b8e0a57940', 38.5690676, -7.9175302999999531, CAST(0x0000A3DC00F67A5D AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0649ea57-017b-451b-8d93-0a440551ca80', 38.5693596, -7.9082769999999982, CAST(0x0000A3DC00F07E1C AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'9f7a8bca-ddb3-4d74-9367-0c837a34bb91', 38.5664284, -7.9026410000000169, CAST(0x0000A3E0016A2B38 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'b291525a-ebb5-4dfa-9f7e-0efb74272bf6', 38.5719461, -7.9155312999999978, CAST(0x0000A3E0012A23FE AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'44799041-2cc1-467a-8f94-108f7bcd50ac', 38.574747, -7.9163912000000209, CAST(0x0000A3DC0106C7AE AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'f4c7ef9b-4e4d-4881-9c01-1227acfe18cc', 38.5739458, -7.9032095999999683, CAST(0x0000A3DC00F535DE AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'25928800-29df-4297-96cd-12444d3171de', 38.5653476, -7.9094569999999749, CAST(0x0000A3DC0102A41A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'c479c126-e425-468a-b8f2-1584ad9edbb0', 38.5701901, -7.9015362999999752, CAST(0x0000A3DC01138907 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5bf1325d-f910-4f76-9d0b-17f865be74bd', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC00FA4638 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'e43242e1-b815-46e2-bb61-197ed4d3a757', 38.5719461, -7.9155312999999978, CAST(0x0000A3DC01067536 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'bfbe8bf4-ce42-41bb-932c-19d69f48dd9d', 38.570941, -7.9093789999999444, CAST(0x0000A3E100093C69 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'005f2860-f0c5-49a6-9b6f-1b40aaee6e61', 38.5739458, -7.9032095999999683, CAST(0x0000A3E00181840C AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'31bbedfa-0817-4f70-ba9c-1f069a003a38', 38.5719461, -7.9155312999999978, CAST(0x0000A3E00179468E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0ba3021e-348a-41cb-be1e-1f13ef5b7bb8', 38.5665979, -7.9056627999999591, CAST(0x0000A3E0017268B0 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'69556f46-0cab-4d06-a059-212fcd25d4fc', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC00EE4209 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'eef9bf24-9d6e-43ca-98cb-219c36d735b0', 38.574747, -7.9163912000000209, CAST(0x0000A3E0017AA64E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'956e75fb-2983-4c03-a2ef-21b650779f4d', 38.5689513, -7.9032412999999906, CAST(0x0000A3E00171091A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'd12c9a35-9701-4b25-ba51-230685522977', 38.5720499, -7.9034381000000167, CAST(0x0000A3E0016E49EE AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'071cf967-69b7-4bd7-94d8-25fc31a3daf6', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC00F173F6 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fbd23ef0-ccea-4250-b645-2f8fc4e499bc', 38.5693596, -7.9082769999999982, CAST(0x0000A3DC01054184 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'a8e4b841-020b-49cf-bc4f-314f3bec04d2', 38.5689513, -7.9032412999999906, CAST(0x0000A3E100051DC7 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'379f66a6-aa7b-4fd2-9ff2-31e21e99c43e', 38.570941, -7.9093789999999444, CAST(0x0000A3E001260547 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'51be17e2-5821-4234-90bf-327c555649fd', 38.5701901, -7.9015362999999752, CAST(0x0000A3E0011DC7DC AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5c6e7d3e-51c4-4db4-98d9-34f5d48b37ab', 38.5665979, -7.9056627999999591, CAST(0x0000A3DC00F03404 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fed0402b-ea8a-4a42-bce8-35794dbe40d8', 38.5701901, -7.9015362999999752, CAST(0x0000A3E10000FEE4 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'a7194fbe-3c55-4462-a356-38aa8677b4c1', 38.5693596, -7.9082769999999982, CAST(0x0000A3E10007DCDF AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fadb0272-28f0-47e5-8e21-38ac99ce7bce', 38.570941, -7.9093789999999444, CAST(0x0000A3DC00FCD29F AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'd77927a7-68e4-4b17-acb1-3948bdd4d0f1', 38.570941, -7.9093789999999444, CAST(0x0000A3DC00F0CC71 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'4c93584c-b585-4d55-8da7-3a04ba51133e', 38.5653476, -7.9094569999999749, CAST(0x0000A3DC010AB4AB AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'4b53bcc8-bc92-4df3-928a-3c544a0f0998', 38.5691873, -7.9043569000000389, CAST(0x0000A3E0012086FF AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'f766d4e8-ede1-4692-8323-3e49a7e8a90e', 38.562692, -7.9062516999999843, CAST(0x0000A3DC00ECEFC4 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'd5b4462a-3fd5-4a81-a437-3f994e2c5984', 38.5691873, -7.9043569000000389, CAST(0x0000A3DC01164524 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5793f326-04c0-49a2-8be7-40bd6eb3dccd', 38.5733317, -7.9089307000000417, CAST(0x0000A3DC00FEDC63 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fd96402e-1653-41bd-a0de-41b8ce1130f8', 38.5693596, -7.9082769999999982, CAST(0x0000A3DC00FC83D8 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'38302f37-206b-4fb6-8773-438f3bf893d3', 38.5689513, -7.9032412999999906, CAST(0x0000A3E0016B8ACB AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'aa9e3966-eaef-42ae-86db-4b3758c345bc', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC0104AD9A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'2171187a-74d3-4f04-b349-4d8ff9bb17a3', 38.5690676, -7.9175302999999531, CAST(0x0000A3E00185A2CF AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'b5c4a957-81e0-4a3f-862f-4e78aac5f17b', 38.5701901, -7.9015362999999752, CAST(0x0000A3DC00EEDF76 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'91300733-fec7-41f9-a419-4ff009664273', 38.5706994, -7.9119794000000638, CAST(0x0000A3E00176876E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'08432e59-c657-40c4-a67a-50d40cf80045', 38.5720499, -7.9034381000000167, CAST(0x0000A3DC01041624 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'58f5cc07-53fb-4c6f-a887-531a5a9d979a', 38.5739458, -7.9032095999999683, CAST(0x0000A3DC0108DD51 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7229506e-ab26-4466-af11-53a0541ec8ae', 38.5737883, -7.9096002999999655, CAST(0x0000A3E00182E3B2 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'228cf799-4cdc-431a-ae06-5407706bd426', 38.5653476, -7.9094569999999749, CAST(0x0000A3DC010E0D2E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'82975d8b-eaf6-4a24-8256-55c27870ea87', 38.562692, -7.9062516999999843, CAST(0x0000A3DC00F9AB80 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'6f7e3db7-ffaa-4182-9b18-563061298ed2', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC011249DF AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'c27437d3-f76a-4d77-93b4-564d6ccc9cc4', 38.5706994, -7.9119794000000638, CAST(0x0000A3E00177E6FF AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'4a639503-3b9c-448a-9861-568433b8e338', 38.5665979, -7.9056627999999591, CAST(0x0000A3DC0104F67E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'46cfc07d-e00f-4759-ac95-56ba97faa5f7', 38.5691873, -7.9043569000000389, CAST(0x0000A3E0016FA98A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7c2a74e5-8d96-44ff-8753-575c71746f67', 38.5664284, -7.9026410000000169, CAST(0x0000A3DC00F9FB02 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5075ed5c-54c8-40ca-a92d-59f20a22a28f', 38.5719461, -7.9155312999999978, CAST(0x0000A3DC00F1F8EC AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'8eeb77ba-add0-45a5-a6ad-5a58b74736c8', 38.574747, -7.9163912000000209, CAST(0x0000A3E1000EBAB9 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'6ac45bfc-bf49-4d96-9a97-5addc18b3f8c', 38.5689513, -7.9032412999999906, CAST(0x0000A3E0011C684C AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'ef00746b-61ae-446a-890c-5bcea2222203', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC00FD26A4 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'3c0a9062-4fc6-4439-84ca-5fb57f2fdda3', 38.5691873, -7.9043569000000389, CAST(0x0000A3E10003BE0E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'9b07c334-5497-430b-878c-63307faf75e0', 38.5719461, -7.9155312999999978, CAST(0x0000A3DC00FDDAB7 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'e064b4d5-98b7-45d8-9630-636739f433a4', 38.5744402, -7.9129516000000422, CAST(0x0000A3E100101A64 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'a6c1aa9e-4a59-4cd0-a2dc-661894515dcf', 38.5720499, -7.9034381000000167, CAST(0x0000A3E100025E75 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'a046dfc8-cac7-4d5e-9122-69791a1fe4f0', 38.5737883, -7.9096002999999655, CAST(0x0000A3DC01093705 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'83159ed1-61aa-49c1-a36e-6c4bba8f8ae6', 38.5736278, -7.9062404000000015, CAST(0x0000A3DC0107D1AB AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'c3b402d1-1db5-4c4d-b21c-719e9be91541', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC0105D853 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'1a323ddc-987d-495b-8e83-78c33632bef6', 38.5664284, -7.9026410000000169, CAST(0x0000A3DC0110F207 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'abc10c82-9e72-41fd-9326-7c64b8ff9efa', 38.5693596, -7.9082769999999982, CAST(0x0000A3E00124A5B5 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'dbb3b080-a6d2-46ab-b0e8-7ce7a53ac36d', 38.5744402, -7.9129516000000422, CAST(0x0000A3DC00FE7AF6 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'19bd4627-672a-43cb-8f85-7e76c461485b', 38.5737883, -7.9096002999999655, CAST(0x0000A3DC00F5A7CA AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'd5860da1-acc7-4292-a471-83704921937f', 38.5736278, -7.9062404000000015, CAST(0x0000A3DC00F374B5 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'27b238ff-6ebd-435b-8f3f-83bddf94e66d', 38.562692, -7.9062516999999843, CAST(0x0000A3DC010F69E0 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0f837179-d5a6-4024-9116-84cf142ef6c3', 38.574747, -7.9163912000000209, CAST(0x0000A3DC00F24952 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'93e1dc46-bab6-4ef2-8214-885c401b3767', 38.5653476, -7.9094569999999749, CAST(0x0000A3DC00EC4013 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7d15949e-d13e-4932-a75e-898d42e80973', 38.562692, -7.9062516999999843, CAST(0x0000A3DC0102EB9A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'f208ce46-e60e-4649-a57c-8aea8804e620', 38.5720499, -7.9034381000000167, CAST(0x0000A3DC00EF2FC2 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'e2e31a13-a3c3-4419-a892-8aeaa4c057da', 38.562692, -7.9062516999999843, CAST(0x0000A3E00119A925 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'40aed0c3-fb7b-444f-8fa6-8ceb5d00f09f', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC01037E49 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'13634781-8787-438c-b4a3-8f39fed45b20', 38.5653476, -7.9094569999999749, CAST(0x0000A3DC00F95C9C AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5eca1a0e-a9a2-4b28-8033-8fb2cfe5ecc1', 38.5744402, -7.9129516000000422, CAST(0x0000A3DC00F29938 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'86d96444-24c6-4acc-b20a-905bd938772f', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC00F11F22 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'48d1f94e-e59a-4e7b-b2e7-9119040fdc19', 38.5733317, -7.9089307000000417, CAST(0x0000A3E0017D654E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'39ba9590-db8c-43d1-93d7-93889521af3a', 38.5736278, -7.9062404000000015, CAST(0x0000A3E0017EC4E2 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'9301a900-e86a-424b-8792-93c972a93b91', 38.5691873, -7.9043569000000389, CAST(0x0000A3DC01046804 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5f312621-bd4f-43dd-9cc9-98d5816ce325', 38.5693596, -7.9082769999999982, CAST(0x0000A3E00173C847 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'cbb9f4db-492a-478e-862e-98d97d08fe14', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC010622A9 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'281deb5d-cfd4-4342-a22f-9a4529f41b84', 38.5733317, -7.9089307000000417, CAST(0x0000A3E100117A13 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'3e33e7fa-f024-424b-a033-9e2ef6677c23', 38.5701901, -7.9015362999999752, CAST(0x0000A3E0016CEA5C AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'e982ff69-6cc6-4dcf-91c0-9fa038c3265e', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC00EFD790 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'70c31a3b-7753-4ec7-9f20-a08414f2a9ff', 38.562692, -7.9062516999999843, CAST(0x0000A3E00168CBA6 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0a7a9522-07a1-47f7-bcf1-a6b91faac94c', 38.562692, -7.9062516999999843, CAST(0x0000A3E001886230 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7794e8ba-e413-4831-aaac-a71f2d2d7d5d', 38.5653476, -7.9094569999999749, CAST(0x0000A3E001189534 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'd39bdd5c-1c18-4f7e-90c0-aa5ac7e4a05d', 38.5747516, -7.901795399999969, CAST(0x0000A3DC0108931E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'107db522-a5c4-455f-b737-aa5e5cb287c1', 38.5733317, -7.9089307000000417, CAST(0x0000A3DC00F3206B AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'25a05f8f-aa1e-4896-9a91-ad55506d6b39', 38.5706994, -7.9119794000000638, CAST(0x0000A3DC00FD8DCD AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'ce6f0729-3b70-4cec-bcac-b780360cd123', 38.5720499, -7.9034381000000167, CAST(0x0000A3E0011F2769 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5734a273-9196-4749-8996-ba11b5a9a4e7', 38.5665979, -7.9056627999999591, CAST(0x0000A3E001234625 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'ab69693e-6db3-4781-ac87-bdea2bff57fb', 38.5664284, -7.9026410000000169, CAST(0x0000A3E0011B08B6 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'de495f4d-3927-4759-a948-c27bd9c2d67f', 38.5689513, -7.9032412999999906, CAST(0x0000A3E0018B2151 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fbd91ba7-7416-4041-9310-c55e4cff61dd', 38.5701901, -7.9015362999999752, CAST(0x0000A3DC00FA9599 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'3cd7fc64-4e65-4234-bd72-c97b29762aad', 38.5665979, -7.9056627999999591, CAST(0x0000A3DC00FC2E57 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'4d880865-b423-4ae6-88c0-ca5824759ed1', 38.5744402, -7.9129516000000422, CAST(0x0000A3E0017C05B7 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'87671588-f9dd-4d18-93bc-cac0c492e000', 38.5748003, -7.909974899999952, CAST(0x0000A3E00184433A AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'1b7e4c74-04f6-4271-be3b-cb86c0115241', 38.5665979, -7.9056627999999591, CAST(0x0000A3E100067D3B AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'371682bb-7d80-4c01-9343-cd58d471af31', 38.5720499, -7.9034381000000167, CAST(0x0000A3DC00FAE5E1 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'da96d5bd-0b67-4b3a-996c-ce61bb212fe2', 38.5736278, -7.9062404000000015, CAST(0x0000A3E10012D9B9 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'80270382-0fa1-4512-af77-cfde3b784f94', 38.5748003, -7.909974899999952, CAST(0x0000A3DC00F60893 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'8dbce5ef-1e1c-40a3-80ef-d04b1faec377', 38.5691873, -7.9043569000000389, CAST(0x0000A3DC00EF7FE0 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'7193d8f3-286a-4e1d-81f8-d42705d900d4', 38.5719461, -7.9155312999999978, CAST(0x0000A3E1000D5B24 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'ec5cdbe6-7fad-4d46-80d7-d5a481010b02', 38.5706994, -7.9119794000000638, CAST(0x0000A3E0012764D5 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'3ffb14c6-bc7d-4265-ab7a-d98681a776d4', 38.5748003, -7.909974899999952, CAST(0x0000A3DC0109856F AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'e76f9d21-a65b-4260-994c-d987fcf12dcc', 38.5747516, -7.901795399999969, CAST(0x0000A3DC00F3EF06 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0b906c73-8f0d-4887-b999-dced8ff0e52a', 38.5733317, -7.9089307000000417, CAST(0x0000A3DC01076C94 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'dd19a351-c3a7-4493-b914-defdf93edd62', 38.5706994, -7.9119794000000638, CAST(0x0000A3E1000BFB86 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'01a9730a-e5e4-47ac-a457-e0177edbc16d', 38.574747, -7.9163912000000209, CAST(0x0000A3E0012B8390 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'cfe76e6c-68dd-4152-b11d-e184150edfcd', 38.5664284, -7.9026410000000169, CAST(0x0000A3DC01033558 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'0c59e326-8c4b-48cc-b498-e348248e742c', 38.5701901, -7.9015362999999752, CAST(0x0000A3DC0103CC19 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'fd927d78-4c59-4e0a-9162-e44261c25368', 38.574747, -7.9163912000000209, CAST(0x0000A3DC00FE2B48 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'77085856-1fc3-407b-b538-e7314e6ff3a5', 38.570941, -7.9093789999999444, CAST(0x0000A3DC01058C7E AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'5b22abff-d76a-4926-b6c2-ee753b816ab7', 38.5689513, -7.9032412999999906, CAST(0x0000A3E00121E692 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'ba59d10f-7615-482c-96a2-f0465f6c2d4f', 38.5653476, -7.9094569999999749, CAST(0x0000A3E001677BAC AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'f5466821-88d7-4e07-bf5a-f40e828e054f', 38.5720499, -7.9034381000000167, CAST(0x0000A3DC0114E591 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'4fa46b47-a40e-4362-a1bd-f6a595f05d59', 38.5747516, -7.901795399999969, CAST(0x0000A3E001802477 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'b30918e6-2809-4d82-ade1-f6e18601ee7a', 38.5664284, -7.9026410000000169, CAST(0x0000A3DC00ED4B68 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'04f0a821-4256-40cf-bab2-f7f816d33b05', 38.5744402, -7.9129516000000422, CAST(0x0000A3DC010716C8 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'57affd9a-f63e-46a0-8bed-fd9bbb1e109f', 38.5706994, -7.9119794000000638, CAST(0x0000A3E1000A9C05 AS DateTime))
INSERT [dbo].[BusInfo] ([stamp], [latbusposition], [longbusposition], [dataHoraBus]) VALUES (N'99e49821-1586-4fea-83ca-ffc07e70ade1', 38.5689513, -7.9032412999999906, CAST(0x0000A3DC00FBDFDC AS DateTime))
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/06/2014 15:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201411071420345_InitialCreate', N'TemporaryCoffin.Models.DbModel.TemporaryCoffinModel', 0x1F8B0800000000000400E559DB6EDB46107D2FD07F20F8D4028E682728901A5402478A53A3BE21B4F3BE2287F2A27B61B84B43FAB63EF493FA0B9DE5FDA60B251A4D10E841E272E7ECCCEC99D9D9D1BF7FFFE3BE5F71663D43ACA81453FB6C726A5B207C1950B19CDA890E5FBDB5DFBFFBF927F763C057D69762DE1B330F25859ADA4F5A47E78EA3FC27E0444D38F563A964A827BEE40E09A4F3FAF4F477E7ECCC0184B011CBB2DCCF89D09443FA808F33297C887442D88D0C80A97C1CDF7829AA754B38A888F830B51F80473226F17A26C3908A492631992FD21FB675C12841AD3C60A16D1121A4261A753E7F54E0E9588AA517E100610FEB08705E489882DC96F36AFABE669DBE366639956001E5274A4B3E10F0EC4DEE27A72D7E90B7EDD28FE8C98FE871BD3656A7DE9CDA1F1235279A5C8950C63C5FA4BDECF98CC5466497DBF1DB604DBA9827564BF2A4641192CD7C4EAC59C27412C35440A263C24EACFB64C1A8FF27AC1FE45F20A62261AC6E0B5A83EF1A0338741FCB0862BDFE0C616EE1D5DCB69CA69CD3162CC56A3299C59F121AD8D62DAE4D160C4AA6385BC5AFD1689D045080CC259A02C36190A763E098CDF8039D5FC2100D0F18783B805CA762CB560E5D53F1448EA74D0AF38331E55672C8DD97A16076C2A46B5B3764750D62A99FA6F66F98652FE90A826220477E14145334CAE83839805C445F2100952390741C20A22F291F419BA1287BF3FC9EC46409421D4FF502E90763FB55D0E0FA41186C9CDCCA46CAAD2680B3DDE45B42187F1E1FC3DB798AD5932654409C2BD622565E1775888B0551CE5D952BD1343703F74097674920151EF0B6552993D5593DC77EC779BD6839273A78F9F83E1055647650AA577DBE2CBD56159B4E566D1655A9B3A12C756F4814E13ED7CAD47CC4F2B21A75F6CA1B5EB0F10CC3F1554FDD566A5BAEA4A5B1AEF51697464D2F69ACB4D99005314C9A05BC33AD97231BDC5D2CD9A2413BCF54FE2F04CCEF5E4AB673630F7F5AE8958F2FD16C0E42A71E8052C9DE7AB60392DE280823714F769B499670913D2B4D78D426E03680AAEEABC360C65A242A928AF6C5C456BC2A49350071F840C4AA14AC0306F9681AD75D30D76979BDBDE94E67D75BE74A9B45FB732C4B0223B2AC17700F626D907B312ED52AC33A8EA88607F1B228D13A3A0D07AB157C75B4C6493848B7B4606B454C4EFB616A7581AA00FAB6685D9E4A23327B13E61EE4DE2CFA62FC2E6BC1E319C936A5DDC124629B13EE60AC463C0C089417A565A7EE694F29572FEB9F569DE3E635C7EE1E5DA708C9A6D8163AEA9906A600F1D64A039FA47722EF2B9B318AF656136E88A021289D5D746CAC91DEB65A7BDF4E9BCD512A60837B6D07DCDB7A236DF7D52D17CB2AE344D0AF09A08B51C590427CC82DAC518164B02193441F74151B0DAC51CA644038047AF476D7F7BA73A2DD7112CF24F69F48DCE9390D04AEE7EE6376B0E7467D20AF5A9D82C3D9391866784BE97BA55377D7C7C82DFFD7BEEDC5C622607EE164F5EBA83D9BEEB57D7BEFA3AFE3B2575B263B8931352E4CD736D31EE799393B1B2E3BDA357DD041ADCDB3037DAF4E4EDF1A47F779BA758DEBD4FFA174E7A0E8B28230FF570AF08D432BD0628EF164C12434AEAE5131A545B41BD0C41C5E1731860DF135BEF641A9B493F885B004A77CE40B08AEC45DA2A3445F28057CC1D6757B5D67FBFA6933ABA9B37B179927358609A8263587ED9DF8905016947A5FF6C4C5060813019F00C753A27A1ABF61B92E916EA5D8132877DF1C2210261599BB1326165077C223CF70886E8F0AAE6149FC75519E6E06D9BD114DB7BB734A9631E12AC7A8E4F111391CF0D5BBFF00EEBC7801A81F0000, N'6.1.1-30610')
