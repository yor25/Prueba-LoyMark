USE [master]
GO
/****** Object:  Database [prueba_loymark_db]    Script Date: 5/7/2022 21:16:49 ******/
CREATE DATABASE [prueba_loymark_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba_loymark_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\prueba_loymark_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_loymark_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\prueba_loymark_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [prueba_loymark_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba_loymark_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba_loymark_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prueba_loymark_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba_loymark_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba_loymark_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prueba_loymark_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba_loymark_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba_loymark_db] SET  MULTI_USER 
GO
ALTER DATABASE [prueba_loymark_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba_loymark_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba_loymark_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba_loymark_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba_loymark_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba_loymark_db] SET QUERY_STORE = OFF
GO
USE [prueba_loymark_db]
GO
/****** Object:  Table [dbo].[t_actividad]    Script Date: 5/7/2022 21:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_actividad](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NULL,
	[id_usuario] [int] NULL,
	[actividad] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_usuario]    Script Date: 5/7/2022 21:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](12) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[correo] [varchar](40) NOT NULL,
	[fecha_de_nacimiento] [date] NOT NULL,
	[telefono] [varchar](8) NULL,
	[pais] [varchar](20) NOT NULL,
	[p_info] [bit] NOT NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_actividad] ON 

INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (4, CAST(N'2022-06-24' AS Date), 7, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (5, CAST(N'2022-06-24' AS Date), 8, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (6, CAST(N'2022-06-24' AS Date), 9, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (7, CAST(N'2022-06-24' AS Date), 8, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (8, CAST(N'2022-06-24' AS Date), 9, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (9, CAST(N'2022-06-24' AS Date), 10, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (10, CAST(N'2022-06-24' AS Date), 10, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (11, CAST(N'2022-06-24' AS Date), 8, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (12, CAST(N'2022-06-29' AS Date), 11, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (13, CAST(N'2022-06-29' AS Date), 12, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (14, CAST(N'2022-06-29' AS Date), 7, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (15, CAST(N'2022-06-29' AS Date), 13, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (16, CAST(N'2022-06-29' AS Date), 12, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (17, CAST(N'2022-07-02' AS Date), 14, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (18, CAST(N'2022-07-02' AS Date), 12, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (19, CAST(N'2022-07-02' AS Date), 15, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (20, CAST(N'2022-07-02' AS Date), 13, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (21, CAST(N'2022-07-02' AS Date), 16, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (22, CAST(N'2022-07-02' AS Date), 13, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (23, CAST(N'2022-07-02' AS Date), 16, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (24, CAST(N'2022-07-02' AS Date), 15, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (25, CAST(N'2022-07-02' AS Date), 17, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (26, CAST(N'2022-07-02' AS Date), 10, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (27, CAST(N'2022-07-02' AS Date), 18, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (28, CAST(N'2022-07-02' AS Date), 17, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (29, CAST(N'2022-07-02' AS Date), 19, N'Usuario Creado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (30, CAST(N'2022-07-02' AS Date), 19, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (31, CAST(N'2022-07-02' AS Date), 19, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (32, CAST(N'2022-07-02' AS Date), 19, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (33, CAST(N'2022-07-02' AS Date), 19, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (34, CAST(N'2022-07-02' AS Date), 19, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (35, CAST(N'2022-07-03' AS Date), 19, N'Usuario eliminado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (36, CAST(N'2022-07-03' AS Date), 18, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (37, CAST(N'2022-07-03' AS Date), 18, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (38, CAST(N'2022-07-03' AS Date), 18, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (39, CAST(N'2022-07-03' AS Date), 18, N'Usuario actualizado')
INSERT [dbo].[t_actividad] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (40, CAST(N'2022-07-03' AS Date), 18, N'Usuario actualizado')
SET IDENTITY_INSERT [dbo].[t_actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[t_usuario] ON 

INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (7, N'pedro', N'infante', N'pedroi@gmail.com', CAST(N'2022-06-08' AS Date), N'12345678', N'PRK', 0, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (8, N'zorro', N'rivera', N'zorroi@gmail.com', CAST(N'2022-06-08' AS Date), N'12345678', N'PRK', 0, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (9, N'zorro', N'rivera', N'zorroi@gmail.com', CAST(N'2022-06-08' AS Date), N'12345678', N'PRK', 0, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (10, N'nikol', N'conejo', N'nsegura@gmail.com', CAST(N'2022-07-12' AS Date), N'00000000', N'BDI', 1, N'U')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (11, N'mela', N'juarez', N'mjuarez@gmail.com', CAST(N'1997-08-07' AS Date), N'12345678', N'CRI', 1, N'C')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (12, N'mela', N'fallas', N'mjuarez@gmail.com', CAST(N'1997-08-30' AS Date), N'12345678', N'GRL', 1, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (13, N'melanie', N'juarez', N'mjuarez@gmail.com', CAST(N'1997-08-30' AS Date), N'12345678', N'CRI', 1, N'U')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (14, N'alex', N'fallas', N'afallas@hotmail.com', CAST(N'2015-02-04' AS Date), N'12345678', N'AGO', 1, N'C')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (15, N'melanie', N'juarez', N'mjuarez@gmail.com', CAST(N'1997-08-30' AS Date), N'12345678', N'CRI', 1, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (16, N'melanie', N'juarez', N'mjuarez@gmail.com', CAST(N'1997-08-30' AS Date), N'12345678', N'CRI', 1, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (17, N'nikol', N'conejo', N'nsegura@gmail.com', CAST(N'2022-07-12' AS Date), N'12345678', N'BDI', 1, N'D')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (18, N'jose', N'viquez', N'jviquez@gmail.com', CAST(N'2021-02-18' AS Date), N'09876543', N'DEU', 1, N'U')
INSERT [dbo].[t_usuario] ([id], [nombre], [apellido], [correo], [fecha_de_nacimiento], [telefono], [pais], [p_info], [estado]) VALUES (19, N'gabriel', N'garcia', N'ggarcia@gmail.com', CAST(N'2022-07-06' AS Date), N'12345678', N'PRK', 0, N'D')
SET IDENTITY_INSERT [dbo].[t_usuario] OFF
GO
ALTER TABLE [dbo].[t_actividad]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[t_usuario] ([id])
GO
/****** Object:  StoredProcedure [dbo].[create_a]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[create_a]
 @create_date date,
 @id_usuario int,
 @actividad varchar (40)
 as
 insert into t_actividad values
 (
 @create_date,
 @id_usuario,
 @actividad 
 );
GO
/****** Object:  StoredProcedure [dbo].[create_u]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[create_u]
 @nombre VARCHAR(12),
 @apellido varchar(20),
 @correo varchar(40) ,
 @fecha_de_nacimiento date,
 @telefono varchar(8),
 @pais varchar(20),
 @p_info bit
 as
 insert into t_usuario values
 (
 @nombre ,
 @apellido ,
 @correo ,
 @fecha_de_nacimiento ,
 @telefono ,
 @pais,
 @p_info,
 'C'
 );
 DECLARE @ID_USUARIO INT;
 DECLARE @TODAY DATETIME;
 SET @ID_USUARIO = (SELECT max(id) FROM t_usuario)
 SET @TODAY = (SELECT GETDATE())

 exec create_a @TODAY, @ID_USUARIO, 'Usuario Creado'
GO
/****** Object:  StoredProcedure [dbo].[delete_a]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_a]
	@id int
 as
	UPDATE t_usuario
  SET 
  t_usuario.estado = 'D'
  WHERE id=@id
   DECLARE @TODAY DATETIME;
     SET @TODAY = (SELECT GETDATE())
   exec create_a @TODAY, @id, 'Usuario eliminado'
GO
/****** Object:  StoredProcedure [dbo].[read_a]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[read_a]
 as
	select *
	from t_usuario
	where t_usuario.estado !='D'
GO
/****** Object:  StoredProcedure [dbo].[READ_ACTIVIDAD]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ACTIVIDAD] 
AS
SELECT t_actividad.create_date, t_usuario.nombre+' '+t_usuario.apellido as nombreU, t_actividad.actividad FROM t_actividad, t_usuario
WHERE t_actividad.id_usuario=t_usuario.id
ORDER BY(create_date) DESC
GO
/****** Object:  StoredProcedure [dbo].[updated_u]    Script Date: 5/7/2022 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updated_u]
 @id int,
 @nombre VARCHAR(12),
 @apellido varchar(20),
 @correo varchar(40) ,
 @fecha_de_nacimiento date,
 @telefono varchar(8),
 @pais varchar(20),
 @p_info bit
 as
 UPDATE t_usuario
  SET  nombre =@nombre,
  apellido=@apellido,
  correo=@correo,
  fecha_de_nacimiento = @fecha_de_nacimiento,
  telefono = @telefono,
  pais = @pais,
  p_info = @p_info,
  t_usuario.estado = 'U'
  WHERE id=@id
   DECLARE @TODAY DATETIME;
   SET @TODAY = (SELECT GETDATE())
   exec create_a @TODAY, @id, 'Usuario actualizado'
GO
USE [master]
GO
ALTER DATABASE [prueba_loymark_db] SET  READ_WRITE 
GO
