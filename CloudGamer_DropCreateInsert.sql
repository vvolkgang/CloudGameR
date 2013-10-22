USE [CloudGameR]

/*               DROPPER n CREATER!        */
GO
ALTER TABLE [Aluguer] DROP CONSTRAINT [DF_Aluguer_Activo]
GO
ALTER TABLE [Factura] DROP CONSTRAINT [FK_Factura_IVA]
GO
ALTER TABLE [Editora] DROP CONSTRAINT [FK_Editora_País]
GO
ALTER TABLE [Criadora] DROP CONSTRAINT [FK_Criadora_País]
GO
ALTER TABLE [Utilizador] DROP CONSTRAINT [FK_Utilizador_País]
GO
ALTER TABLE [Preferencia] DROP CONSTRAINT [FK_Preferencia_Genero]
GO
ALTER TABLE [Preferencia] DROP CONSTRAINT [FK_Preferencia_Utilizador]
GO
ALTER TABLE [Jogo] DROP CONSTRAINT [FK_Jogo_Criadora]
GO
ALTER TABLE [Jogo] DROP CONSTRAINT [FK_Jogo_Editora]
GO
ALTER TABLE [Jogo] DROP CONSTRAINT [FK_Jogo_Genero]
GO
ALTER TABLE [Jogo] DROP CONSTRAINT [FK_Jogo_Rate]
GO
ALTER TABLE [Contacto] DROP CONSTRAINT [FK_Contacto_TipoContacto]
GO
ALTER TABLE [Contacto] DROP CONSTRAINT [FK_Contacto_Utilizador]
GO
ALTER TABLE [Aquisicao] DROP CONSTRAINT [FK_Aquisição_Factura]
GO
ALTER TABLE [Aquisicao] DROP CONSTRAINT [FK_Aquisição_Jogo]
GO
ALTER TABLE [Aquisicao] DROP CONSTRAINT [FK_Aquisição_TipoAquisição]
GO
ALTER TABLE [Aquisicao] DROP CONSTRAINT [FK_Aquisição_Utilizador]
GO
ALTER TABLE [Imagem] DROP CONSTRAINT [FK_Imagem_Jogo]
GO
ALTER TABLE [IdiomaJogo] DROP CONSTRAINT [FK_IdiomaJogo_Idioma]
GO
ALTER TABLE [IdiomaJogo] DROP CONSTRAINT [FK_IdiomaJogo_Jogo]
GO
ALTER TABLE [RegistoUtilizacao] DROP CONSTRAINT [FK_Registo Utilizacao_Aquisição]
GO
ALTER TABLE [Aluguer] DROP CONSTRAINT [FK_Aluguer_Aquisicao]
GO
DROP TABLE [Aluguer]
GO
DROP TABLE [RegistoUtilizacao]
GO
DROP TABLE [IdiomaJogo]
GO
DROP TABLE [Imagem]
GO
DROP TABLE [Aquisicao]
GO
DROP TABLE [Contacto]
GO
DROP TABLE [Jogo]
GO
DROP TABLE [Preferencia]
GO
DROP TABLE [Utilizador]
GO
DROP TABLE [Criadora]
GO
DROP TABLE [Editora]
GO
DROP TABLE [Factura]
GO
DROP TABLE [Genero]
GO
DROP TABLE [Idioma]
GO
DROP TABLE [Pais]
GO
DROP TABLE [IVA]
GO
DROP TABLE [TipoAquisicao]
GO
DROP TABLE [TipoContacto]
GO
DROP TABLE [Rate]
GO
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rate](
	[Rate_ID] [int] NOT NULL,
	[Descricao] [nvarchar](15) NOT NULL,
	[Idade_Min] [int] NOT NULL,
	[Idade_Max] [int] NOT NULL,
 CONSTRAINT [Rate_PK] PRIMARY KEY CLUSTERED 
(
	[Rate_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TipoContacto](
	[TipoContacto_ID] [int] NOT NULL,
	[Descricao] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoContacto] PRIMARY KEY CLUSTERED 
(
	[TipoContacto_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TipoAquisicao](
	[TipoAquisicao_ID] [int] NOT NULL,
	[Tipo] [nvarchar](20) NOT NULL,
 CONSTRAINT [TipoAquisição_PK] PRIMARY KEY CLUSTERED 
(
	[TipoAquisicao_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IVA](
	[IVA_ID] [int] NOT NULL,
	[Valor] [float] NOT NULL,
	[Data_Inicio] [date] NOT NULL,
 CONSTRAINT [PK_IVA] PRIMARY KEY CLUSTERED 
(
	[IVA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pais](
	[Pais_ID] [int] NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
 CONSTRAINT [País_PK] PRIMARY KEY CLUSTERED 
(
	[Pais_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Idioma](
	[Idioma_ID] [int] NOT NULL,
	[Idioma] [nvarchar](30) NOT NULL,
 CONSTRAINT [Idioma_PK] PRIMARY KEY CLUSTERED 
(
	[Idioma_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Genero](
	[Genero_ID] [int] NOT NULL,
	[Genero] [nvarchar](30) NOT NULL,
 CONSTRAINT [Genero_PK] PRIMARY KEY CLUSTERED 
(
	[Genero_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Factura](
	[IVA_ID] [int] NOT NULL,
	[Factura_ID] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [Factura_PK] PRIMARY KEY CLUSTERED 
(
	[Factura_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Editora](
	[Editora_ID] [int] NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Pais_ID] [int] NOT NULL,
 CONSTRAINT [Editora_PK] PRIMARY KEY CLUSTERED 
(
	[Editora_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Criadora](
	[Criadora_ID] [int] NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Pais_ID] [int] NOT NULL,
 CONSTRAINT [Criadora_PK] PRIMARY KEY CLUSTERED 
(
	[Criadora_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utilizador](
	[User_ID] [int] NOT NULL,
	[Username] [char](20) NOT NULL,
	[Pass] [nvarchar](15) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Morada] [nvarchar](50) NULL,
	[Referral] [nvarchar](50) NOT NULL,
	[Pais_ID] [int] NOT NULL,
 CONSTRAINT [PK_Utilizador] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Preferencia](
	[User_ID] [int] NOT NULL,
	[Genero_ID] [int] NOT NULL,
 CONSTRAINT [PK_Preferencia] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Genero_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Jogo](
	[Jogo_ID] [int] NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Data_Lancamento] [date] NOT NULL,
	[Descricao] [nvarchar](50) NOT NULL,
	[Preco_Base] [float] NOT NULL,
	[Taxa_Aluguer] [float] NOT NULL,
	[Rate_ID] [int] NOT NULL,
	[Editora_ID] [int] NOT NULL,
	[Criadora_ID] [int] NOT NULL,
	[Genero_ID] [int] NOT NULL,
	[Capa_Endereco] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jogo] PRIMARY KEY CLUSTERED 
(
	[Jogo_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contacto](
	[User_ID] [int] NOT NULL,
	[TipoContacto_ID] [int] NOT NULL,
	[Contacto] [varchar](30) NOT NULL,
 CONSTRAINT [Contacto_PK] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[TipoContacto_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Aquisicao](
	[Aquisicao_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Factura_ID] [int] NOT NULL,
	[Custo_Total] [float] NOT NULL,
	[Jogo_ID] [int] NOT NULL,
	[TipoAquisicao_ID] [int] NOT NULL,
 CONSTRAINT [Aquisição_PK] PRIMARY KEY CLUSTERED 
(
	[Aquisicao_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Imagem](
	[Imagem_ID] [int] NOT NULL,
	[Endereco] [nvarchar](50) NOT NULL,
	[Jogo_ID] [int] NOT NULL,
 CONSTRAINT [Imagem_PK] PRIMARY KEY CLUSTERED 
(
	[Imagem_ID] ASC,
	[Jogo_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IdiomaJogo](
	[Idioma_ID] [int] NOT NULL,
	[Jogo_ID] [int] NOT NULL,
 CONSTRAINT [PK_IdiomaJogo] PRIMARY KEY CLUSTERED 
(
	[Idioma_ID] ASC,
	[Jogo_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RegistoUtilizacao](
	[RegistoUtilizacao_ID] [int] NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFim] [datetime] NOT NULL,
	[Aquisicao_ID] [int] NOT NULL,
 CONSTRAINT [Registo Utilizacao_PK] PRIMARY KEY CLUSTERED 
(
	[RegistoUtilizacao_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Aluguer](
	[TempoAdquirido] [int] NOT NULL,
	[Validade] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Aquisicao_ID] [int] NOT NULL,
	[Aluguer_ID] [int] NOT NULL,
 CONSTRAINT [PK_Aluguer] PRIMARY KEY CLUSTERED 
(
	[Aluguer_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aluguer] ADD  CONSTRAINT [DF_Aluguer_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_IVA] FOREIGN KEY([IVA_ID])
REFERENCES [IVA] ([IVA_ID])
GO
ALTER TABLE [Factura] CHECK CONSTRAINT [FK_Factura_IVA]
GO
ALTER TABLE [Editora]  WITH CHECK ADD  CONSTRAINT [FK_Editora_País] FOREIGN KEY([Pais_ID])
REFERENCES [Pais] ([Pais_ID])
GO
ALTER TABLE [Editora] CHECK CONSTRAINT [FK_Editora_País]
GO
ALTER TABLE [Criadora]  WITH CHECK ADD  CONSTRAINT [FK_Criadora_País] FOREIGN KEY([Pais_ID])
REFERENCES [Pais] ([Pais_ID])
GO
ALTER TABLE [Criadora] CHECK CONSTRAINT [FK_Criadora_País]
GO
ALTER TABLE [Utilizador]  WITH CHECK ADD  CONSTRAINT [FK_Utilizador_País] FOREIGN KEY([Pais_ID])
REFERENCES [Pais] ([Pais_ID])
GO
ALTER TABLE [Utilizador] CHECK CONSTRAINT [FK_Utilizador_País]
GO
ALTER TABLE [Preferencia]  WITH CHECK ADD  CONSTRAINT [FK_Preferencia_Genero] FOREIGN KEY([Genero_ID])
REFERENCES [Genero] ([Genero_ID])
GO
ALTER TABLE [Preferencia] CHECK CONSTRAINT [FK_Preferencia_Genero]
GO
ALTER TABLE [Preferencia]  WITH CHECK ADD  CONSTRAINT [FK_Preferencia_Utilizador] FOREIGN KEY([User_ID])
REFERENCES [Utilizador] ([User_ID])
GO
ALTER TABLE [Preferencia] CHECK CONSTRAINT [FK_Preferencia_Utilizador]
GO
ALTER TABLE [Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Criadora] FOREIGN KEY([Criadora_ID])
REFERENCES [Criadora] ([Criadora_ID])
GO
ALTER TABLE [Jogo] CHECK CONSTRAINT [FK_Jogo_Criadora]
GO
ALTER TABLE [Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Editora] FOREIGN KEY([Editora_ID])
REFERENCES [Editora] ([Editora_ID])
GO
ALTER TABLE [Jogo] CHECK CONSTRAINT [FK_Jogo_Editora]
GO
ALTER TABLE [Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Genero] FOREIGN KEY([Genero_ID])
REFERENCES [Genero] ([Genero_ID])
GO
ALTER TABLE [Jogo] CHECK CONSTRAINT [FK_Jogo_Genero]
GO
ALTER TABLE [Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Rate] FOREIGN KEY([Rate_ID])
REFERENCES [Rate] ([Rate_ID])
GO
ALTER TABLE [Jogo] CHECK CONSTRAINT [FK_Jogo_Rate]
GO
ALTER TABLE [Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_TipoContacto] FOREIGN KEY([TipoContacto_ID])
REFERENCES [TipoContacto] ([TipoContacto_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contacto] CHECK CONSTRAINT [FK_Contacto_TipoContacto]
GO
ALTER TABLE [Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Utilizador] FOREIGN KEY([User_ID])
REFERENCES [Utilizador] ([User_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contacto] CHECK CONSTRAINT [FK_Contacto_Utilizador]
GO
ALTER TABLE [Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Aquisição_Factura] FOREIGN KEY([Factura_ID])
REFERENCES [Factura] ([Factura_ID])
GO
ALTER TABLE [Aquisicao] CHECK CONSTRAINT [FK_Aquisição_Factura]
GO
ALTER TABLE [Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Aquisição_Jogo] FOREIGN KEY([Jogo_ID])
REFERENCES [Jogo] ([Jogo_ID])
GO
ALTER TABLE [Aquisicao] CHECK CONSTRAINT [FK_Aquisição_Jogo]
GO
ALTER TABLE [Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Aquisição_TipoAquisição] FOREIGN KEY([TipoAquisicao_ID])
REFERENCES [TipoAquisicao] ([TipoAquisicao_ID])
GO
ALTER TABLE [Aquisicao] CHECK CONSTRAINT [FK_Aquisição_TipoAquisição]
GO
ALTER TABLE [Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Aquisição_Utilizador] FOREIGN KEY([User_ID])
REFERENCES [Utilizador] ([User_ID])
GO
ALTER TABLE [Aquisicao] CHECK CONSTRAINT [FK_Aquisição_Utilizador]
GO
ALTER TABLE [Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Jogo] FOREIGN KEY([Jogo_ID])
REFERENCES [Jogo] ([Jogo_ID])
GO
ALTER TABLE [Imagem] CHECK CONSTRAINT [FK_Imagem_Jogo]
GO
ALTER TABLE [IdiomaJogo]  WITH CHECK ADD  CONSTRAINT [FK_IdiomaJogo_Idioma] FOREIGN KEY([Idioma_ID])
REFERENCES [Idioma] ([Idioma_ID])
GO
ALTER TABLE [IdiomaJogo] CHECK CONSTRAINT [FK_IdiomaJogo_Idioma]
GO
ALTER TABLE [IdiomaJogo]  WITH CHECK ADD  CONSTRAINT [FK_IdiomaJogo_Jogo] FOREIGN KEY([Jogo_ID])
REFERENCES [Jogo] ([Jogo_ID])
GO
ALTER TABLE [IdiomaJogo] CHECK CONSTRAINT [FK_IdiomaJogo_Jogo]
GO
ALTER TABLE [RegistoUtilizacao]  WITH CHECK ADD  CONSTRAINT [FK_Registo Utilizacao_Aquisição] FOREIGN KEY([Aquisicao_ID])
REFERENCES [Aquisicao] ([Aquisicao_ID])
GO
ALTER TABLE [RegistoUtilizacao] CHECK CONSTRAINT [FK_Registo Utilizacao_Aquisição]
GO
ALTER TABLE [Aluguer]  WITH CHECK ADD  CONSTRAINT [FK_Aluguer_Aquisicao] FOREIGN KEY([Aquisicao_ID])
REFERENCES [Aquisicao] ([Aquisicao_ID])
GO
ALTER TABLE [Aluguer] CHECK CONSTRAINT [FK_Aluguer_Aquisicao]
GO




/*                          ----------  INSERTS  ----------         */

GO
/**** Pais ****/
INSERT [Pais] (	[Pais_ID],[Nome]) VALUES (1, 'Portugal');
INSERT [Pais] (	[Pais_ID],[Nome]) VALUES (2, 'Germany');
INSERT [Pais] (	[Pais_ID],[Nome]) VALUES (3, 'United Kingdom');
INSERT [Pais] ( [Pais_ID],[Nome]) VALUES (4, 'United States of America');

/**** Utilizador ****/
INSERT [dbo].[Utilizador] ([User_ID], [Username],[Pass],[Nome],[Morada],[Referral],[Pais_ID])
	VALUES (1, 'AFernandes','Encrypted_Pass1','Alison Fernandes' ,'Urb. S. Jose','AsW1kL',1);
INSERT [Utilizador] ([User_ID], [Username],[Pass],[Nome] ,[Morada],[Referral],[Pais_ID])
	VALUES (2, 'HRuivo','Encrypted_Pass2','Hugo Ruivo' ,'Vila do conde','GNkIu2a',1);
INSERT [Utilizador] ([User_ID], [Username],[Pass],[Nome] ,[Morada],[Referral],[Pais_ID])
	VALUES (3, 'MCapps','Encrypted_Pass3','Mike Capps' ,'Cary, NC','AdV2Mo7',4);
INSERT [Utilizador] ([User_ID], [Username],[Pass],[Nome] ,[Morada],[Referral],[Pais_ID])
	VALUES (4, 'CYerli','Encrypted_Pass4','Cevat Yerli' ,'Frankfurt am Main','M99ki2Q',2);

/**** TipoContacto ****/
INSERT [TipoContacto] (	[TipoContacto_ID],[Descricao]) VALUES (1, 'Email'); 
INSERT [TipoContacto] (	[TipoContacto_ID],[Descricao]) VALUES (2, 'Phone'); 
INSERT [TipoContacto] (	[TipoContacto_ID],[Descricao]) VALUES (3, 'Fax'); 

/**** Contacto ****/
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (1, 1, 'alisonfernandes@gmail.com');
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (2, 1, 'hugoruivo@gmail.com');
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (3, 1, 'licensing@epicgames.com');
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (3, 2, '+1 919 854 0070');
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (3, 3, '+1 919 854 0055');
INSERT [Contacto] (	[User_ID],[TipoContacto_ID],[Contacto]) VALUES (4, 1, 'contact@crytek.com');

/**** Rate ****/
INSERT [Rate] (	[Rate_ID],[Descricao],[Idade_Min],[Idade_Max]) VALUES (1, 'PEGI 4', 3, -1);
INSERT [Rate] (	[Rate_ID],[Descricao],[Idade_Min],[Idade_Max]) VALUES (2, 'PEGI 6', 7, -1);
INSERT [Rate] (	[Rate_ID],[Descricao],[Idade_Min],[Idade_Max]) VALUES (3, 'PEGI 12', 12, -1);
INSERT [Rate] (	[Rate_ID],[Descricao],[Idade_Min],[Idade_Max]) VALUES (4, 'PEGI 16', 16, -1);	
INSERT [Rate] (	[Rate_ID],[Descricao],[Idade_Min],[Idade_Max]) VALUES (5, 'PEGI 18', 18, -1);

/**** Idioma ****/
INSERT [Idioma] ([Idioma_ID], [Idioma]) VALUES (1, 'English');
INSERT [Idioma] ([Idioma_ID], [Idioma]) VALUES (2, 'Portuguese');
INSERT [Idioma] ([Idioma_ID], [Idioma]) VALUES (3, 'German');
INSERT [Idioma] ([Idioma_ID], [Idioma]) VALUES (4, 'Italian');
INSERT [Idioma] ([Idioma_ID], [Idioma]) VALUES (5, 'Japanese');

/**** Editora ****/
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (1, 'Electronic Arts', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (2, 'Activision', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (3, 'Microsoft Game Studios', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (4, 'Epic', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (5, 'Activision', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (6, 'Bethesda Softworks', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (7, 'Valve', 4)
INSERT [Editora] ([Editora_ID], [Nome], [Pais_ID]) VALUES (8, 'Blizzard Entertainment', 4)

/**** Criadora ***/
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (1, 'Crytek', 2)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (2, 'Epic Games', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (3, 'Bungie', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (4, 'Seed Studios', 1)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (5, 'People Can Fly!', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (6, 'Splash Damage', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (7, 'Visceral Games', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (8, 'Criterion Games', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (9, 'Valve', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (10, 'Blizzard Entertainment', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (11, 'Treyarch', 4)
INSERT [Criadora] ([Criadora_ID], [Nome], [Pais_ID]) VALUES (12, 'Slightly Mad Studios', 4)

/**** Genero ****/
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (1, 'Arcade')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (2, 'Racing')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (3, 'Action')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (4, 'Adventure')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (5, 'Real Time Strategy')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (6, 'Massively Multiplayer Online')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (7, 'Social')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (8, 'Family')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (9, 'Survival Horror')
INSERT [Genero] ([Genero_ID], [Genero]) VALUES (10, 'Puzzle')

/**** Preferencia ****/
INSERT [Preferencia] ([User_ID], [Genero_ID]) VALUES (1, 2);
INSERT [Preferencia] ([User_ID], [Genero_ID]) VALUES (1, 3);
INSERT [Preferencia] ([User_ID], [Genero_ID]) VALUES (2, 5);
INSERT [Preferencia] ([User_ID], [Genero_ID]) VALUES (2, 6);


/**** Jogo ****/
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (1, 'Crysis 2','2011-03-22','First Person Shooter sci fi game.', 39.99, 0.04, 4, 1, 1, 3, 'images/covers/crysis2.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (2, 'Bulletstorm','2011-02-25','First Person Shooter gore game.', 39.99, 0.04, 5, 4, 5, 3, 'images/covers/bulletstorm.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (3, 'NFS Shift 2','2011-02-25','Racing car simulator.', 39.99, 0.04, 1, 1, 12, 2, 'images/covers/nfsshift2.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (4, 'Brink','2011-02-25','First Person Shooter.', 49.99, 0.04, 4, 6, 6, 3, 'images/covers/brink.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (5, 'Dead Space 2','2011-02-25','Third Person shooter horror game.', 39.99, 0.04, 5, 1, 7, 9, 'images/covers/deadspace2.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (6, 'Dead Space','2011-02-25','Third Person shooter horror game.', 19.99, 0.04, 5, 1, 7, 9, 'images/covers/deadspace.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (7, 'NFS Hot Pursuit','2011-02-25','Arcade racing game.', 29.99, 0.04, 1, 1, 8, 2, 'images/covers/nfshotporsuit.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (8, 'Portal 2','2011-02-25','First Person Shooter puzzle game.', 49.99, 0.04, 3, 7, 9, 10, 'images/covers/portal2.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (9, 'StarCraft II','2011-02-25','Real Time Strategy game.', 29.99, 0.04, 5, 8, 10, 5, 'images/covers/starcraftii.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (10, 'Call Of Duty : Black Ops','2010-11-9','First Person Shooter.', 29.99, 0.04, 5, 5, 11, 3, 'images/covers/codblackops.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (11, 'Portal','2007-10-9','First Person Shooter puzzle game.', 19.99, 0.02, 3, 7, 9, 10, 'images/covers/portal.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (12, 'Half Life 2','2004-11-16','First Person Shooter puzzle game.', 19.99, 0.02, 3, 7, 9, 10, 'images/covers/portal.png');
INSERT [Jogo]([Jogo_ID] ,[Nome],[Data_Lancamento],[Descricao],[Preco_Base],[Taxa_Aluguer],[Rate_ID],[Editora_ID],[Criadora_ID],[Genero_ID],[Capa_Endereco]) 
	VALUES (13, 'Team Fortress 2','2007-10-10','First Person Shooter puzzle game.', 19.99, 0.02, 3, 7, 9, 10, 'images/covers/portal.png');	
	
	
	
	

/**** Imagem ****/
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (1, 'crysis2_01.png', 1);
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (2, 'crysis2_02.png', 1);
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (3, 'crysis2_03.png', 1);
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (4, 'bulletstorm_01.png', 2);
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (5, 'bulletstorm_02.png', 2);
INSERT [Imagem] ([Imagem_ID], [Endereco], [Jogo_ID]) VALUES (6, 'bulletstorm_03.png', 2);

/**** IdiomaJogo ****/
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (1, 1);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (3, 1);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (4, 1);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (1, 2);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (3, 2);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (4, 2);
INSERT [IdiomaJogo]   ([Idioma_ID], [Jogo_ID] ) VALUES (2, 2);

/**** IVA ****/
INSERT [IVA] (	[IVA_ID],[Valor],[Data_Inicio]) VALUES (1, 19, '2006-10-5');
INSERT [IVA] (	[IVA_ID],[Valor],[Data_Inicio]) VALUES (2, 21, '2009-07-10');
INSERT [IVA] (	[IVA_ID],[Valor],[Data_Inicio]) VALUES (3, 23, '2011-01-1');

/**** Factura ****/
INSERT [Factura] (	[Factura_ID],[IVA_ID],[Data]) VALUES (1, 1, '2007-02-24 12:25:10'); 
INSERT [Factura] (	[Factura_ID],[IVA_ID],[Data]) VALUES (2, 1, '2007-06-10 18:46:19'); 
INSERT [Factura] (	[Factura_ID],[IVA_ID],[Data]) VALUES (3, 2, '2010-09-15 05:53:37'); 
INSERT [Factura] (	[Factura_ID],[IVA_ID],[Data]) VALUES (4, 3, '2011-05-03 22:30:01'); 

/**** TipoAquisicao ****/
INSERT [TipoAquisicao] ([TipoAquisicao_ID] , [Tipo] ) VALUES (1, 'Buy');
INSERT [TipoAquisicao] ([TipoAquisicao_ID] , [Tipo] ) VALUES (2, 'Rent');

/**** Aquisicao ****/
/*ACRESCENTAR MAIS DADOS*/
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (1, 1,4,39.99,1,1);
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (2, 1,4,9.6,2,2);
	
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (3, 1,4,39.99,3,1);/* APENAS PARA TESTE*/
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (4, 1,4,39.99,1,1);/* APENAS PARA TESTE*/
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (5, 1,4,39.99,3,1);/* APENAS PARA TESTE*/
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (6, 1,4,39.99,10,1);/* APENAS PARA TESTE*/	
INSERT [Aquisicao] ([Aquisicao_ID],[User_ID],[Factura_ID],[Custo_Total],[Jogo_ID],[TipoAquisicao_ID] ) 
	VALUES (7, 2,4,39.99,1,1);	
	
/**** Aluguer ****/
/*ACRESCENTAR MAIS DADOS*/
INSERT [Aluguer] ([Aluguer_ID] ,[Aquisicao_ID],[TempoAdquirido],[Validade]) VALUES (1,2, 5,'2011-05-15 16:05:32');	

/**** Registo Utilizacao ****/
/* MELHORAR- meter horas, verificar se as diferencas entre as horas alugadas e as utilizadas batem certo */
/*ACRESCENTAR MAIS DADOS*/
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (1, '2011-05-3 ', '2011-05-4',1);
	
/*dados metidos so para testar, ALTERAR ISTO!!!*/	
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (2, '2011-05-5 ', '2011-05-7',1);
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (3, '2011-05-5 ', '2011-05-7',2);  	
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (4, '2011-05-7 ', '2011-05-8',2);
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (5, '2011-05-7 ', '2011-05-8',3); 
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (6, '2011-05-7 ', '2011-05-8',6);  	  	
INSERT [RegistoUtilizacao] ([RegistoUtilizacao_ID],[DataInicio] ,[DataFim], [Aquisicao_ID]) 
	VALUES (7, '2011-05-7 ', '2011-05-8',7); 