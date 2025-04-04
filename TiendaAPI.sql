USE [TiendaAPI]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IdArticulo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoArticulo] [varchar](20) NOT NULL,
	[NombreArticulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Imagen] [varchar](max) NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Baja] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[IdCarrito] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaActualiza] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCarrito]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCarrito](
	[IdCarrito] [int] NOT NULL,
	[IdInventario] [int] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IdCompra] [int] NOT NULL,
	[IdInventario] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Alias] [varchar](50) NOT NULL,
	[Calle] [varchar](70) NOT NULL,
	[NumExterior] [varchar](20) NOT NULL,
	[NumInterior] [varchar](20) NULL,
	[Colonia] [varchar](70) NOT NULL,
	[Alcaldia] [varchar](70) NOT NULL,
	[CodigoPostal] [varchar](5) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Baja] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[Existencias] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTienda] [varchar](50) NOT NULL,
	[Calle] [varchar](70) NOT NULL,
	[NumExterior] [varchar](20) NOT NULL,
	[NumInterior] [varchar](20) NULL,
	[Colonia] [varchar](70) NOT NULL,
	[Alcaldia] [varchar](70) NOT NULL,
	[CodigoPostal] [varchar](5) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Baja] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/03/2025 12:27:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Telefono] [varchar](10) NULL,
	[Password] [varchar](20) NOT NULL,
	[TipoUsuario] [varchar](15) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Baja] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo] ADD  CONSTRAINT [DF_Articulo_Baja]  DEFAULT ((0)) FOR [Baja]
GO
ALTER TABLE [dbo].[Direccion] ADD  CONSTRAINT [DF_Direccion_Baja]  DEFAULT ((0)) FOR [Baja]
GO
ALTER TABLE [dbo].[Sucursal] ADD  CONSTRAINT [DF_Tienda_Baja]  DEFAULT ((0)) FOR [Baja]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Baja]  DEFAULT ((0)) FOR [Baja]
GO
