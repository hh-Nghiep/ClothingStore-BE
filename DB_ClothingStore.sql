USE [master]
GO
/****** Object:  Database [DB_ClothingWebsite]    Script Date: 9/17/2022 4:42:46 AM ******/
CREATE DATABASE [DB_ClothingWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ClothingWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_ClothingWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ClothingWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_ClothingWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_ClothingWebsite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ClothingWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ClothingWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ClothingWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ClothingWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_ClothingWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ClothingWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_ClothingWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ClothingWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ClothingWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ClothingWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ClothingWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_ClothingWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_ClothingWebsite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_ClothingWebsite', N'ON'
GO
ALTER DATABASE [DB_ClothingWebsite] SET QUERY_STORE = OFF
GO
USE [DB_ClothingWebsite]
GO
/****** Object:  Table [dbo].[CT_DonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonHang](
	[maDH] [int] NOT NULL,
	[maCTSP] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[gia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_KhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_KhuyenMai](
	[maKM] [int] NOT NULL,
	[maCTSP] [int] NOT NULL,
	[phanTramGiam] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PhieuNhap]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuNhap](
	[maPhieuNhap] [int] NOT NULL,
	[maCTSP] [int] NOT NULL,
	[soLuongTon] [int] NOT NULL,
	[gia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PhieuTra]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuTra](
	[maPhieuTra] [int] NOT NULL,
	[maCTSP] [int] NOT NULL,
	[soLuong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDH] [int] IDENTITY(1,1) NOT NULL,
	[maNguoiDung] [int] NOT NULL,
	[hoTen] [nvarchar](150) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[diaChi] [nvarchar](500) NOT NULL,
	[ngayTao] [date] NOT NULL,
	[ngayGiao] [date] NULL,
	[trangThai] [int] NOT NULL,
	[maNVDuyet] [int] NULL,
	[maNVGiao] [int] NULL,
 CONSTRAINT [PK_CT_GioHang] PRIMARY KEY CLUSTERED 
(
	[maDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[maDH] [int] NOT NULL,
	[ngayTao] [date] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[maKM] [int] IDENTITY(1,1) NOT NULL,
	[maNV] [int] NOT NULL,
	[ngayApDung] [date] NOT NULL,
	[ngayHetHan] [date] NOT NULL,
	[moTa] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[maKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[maNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](150) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[diaChi] [nvarchar](150) NOT NULL,
	[cmnd] [varchar](50) NOT NULL,
	[password] [varbinary](50) NOT NULL,
	[maQuyen] [int] NOT NULL,
	[trangThai] [int] NOT NULL,
 CONSTRAINT [PK_Nguoiung] PRIMARY KEY CLUSTERED 
(
	[maNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[maSP] [int] IDENTITY(1,1) NOT NULL,
	[tenSP] [nvarchar](150) NOT NULL,
	[maTL] [int] NOT NULL,
	[tongSLTon] [int] NOT NULL,
	[luotXem] [int] NULL,
	[ngayTao] [date] NOT NULL,
	[ngayCapNhat] [date] NULL,
	[hinhAnh1] [varchar](500) NULL,
	[trangThai] [int] NOT NULL,
	[moTa] [nvarchar](500) NULL,
	[hinhAnh2] [varchar](500) NULL,
	[hinhAnh3] [varchar](500) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[maPN] [int] IDENTITY(1,1) NOT NULL,
	[ngayTao] [date] NOT NULL,
	[maNV] [int] NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[maPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuTra]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTra](
	[maPhieuTra] [int] IDENTITY(1,1) NOT NULL,
	[maHoaDon] [int] NOT NULL,
	[ngayTao] [date] NOT NULL,
 CONSTRAINT [PK_PhieuTra] PRIMARY KEY CLUSTERED 
(
	[maPhieuTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[maQuyen] [int] IDENTITY(1,1) NOT NULL,
	[tenQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[maQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maCT] [int] IDENTITY(1,1) NOT NULL,
	[maSP] [int] NOT NULL,
	[maSize] [int] NOT NULL,
 CONSTRAINT [PK_CT_SanPham] PRIMARY KEY CLUSTERED 
(
	[maCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[maSize] [int] IDENTITY(1,1) NOT NULL,
	[tenSize] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[maSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[maTL] [int] IDENTITY(1,1) NOT NULL,
	[tenTL] [nvarchar](50) NOT NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_THELOAI] PRIMARY KEY CLUSTERED 
(
	[maTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CT_GioHang]    Script Date: 9/17/2022 4:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_CT_GioHang] ON [dbo].[CT_DonHang]
(
	[maDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_GioHang_CT_SanPham] FOREIGN KEY([maCTSP])
REFERENCES [dbo].[SanPham] ([maCT])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CT_GioHang_CT_SanPham]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_GioHang_GioHang] FOREIGN KEY([maDH])
REFERENCES [dbo].[DonHang] ([maDH])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CT_GioHang_GioHang]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai] FOREIGN KEY([maKM])
REFERENCES [dbo].[KhuyenMai] ([maKM])
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_SanPham] FOREIGN KEY([maCTSP])
REFERENCES [dbo].[SanPham] ([maCT])
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_SanPham]
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuNhap_CT_SanPham] FOREIGN KEY([maCTSP])
REFERENCES [dbo].[SanPham] ([maCT])
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [FK_CT_PhieuNhap_CT_SanPham]
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuNhap_PhieuNhap] FOREIGN KEY([maPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([maPN])
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [FK_CT_PhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuTra_CT_SanPham] FOREIGN KEY([maCTSP])
REFERENCES [dbo].[SanPham] ([maCT])
GO
ALTER TABLE [dbo].[CT_PhieuTra] CHECK CONSTRAINT [FK_CT_PhieuTra_CT_SanPham]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuTra_PhieuTra] FOREIGN KEY([maPhieuTra])
REFERENCES [dbo].[PhieuTra] ([maPhieuTra])
GO
ALTER TABLE [dbo].[CT_PhieuTra] CHECK CONSTRAINT [FK_CT_PhieuTra_PhieuTra]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY([maNguoiDung])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung1] FOREIGN KEY([maNVDuyet])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung1]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung2] FOREIGN KEY([maNVGiao])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung2]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_GioHang] FOREIGN KEY([maDH])
REFERENCES [dbo].[DonHang] ([maDH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_GioHang]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMai_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [FK_KhuyenMai_NhanVien]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_Quyen] FOREIGN KEY([maQuyen])
REFERENCES [dbo].[Quyen] ([maQuyen])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_Quyen]
GO
ALTER TABLE [dbo].[NhomSanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TheLoai] FOREIGN KEY([maTL])
REFERENCES [dbo].[TheLoai] ([maTL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhomSanPham] CHECK CONSTRAINT [FK_SanPham_TheLoai]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NguoiDung] FOREIGN KEY([maNV])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NguoiDung]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTra_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK_PhieuTra_HoaDon]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_CT_SanPham_SanPham] FOREIGN KEY([maSP])
REFERENCES [dbo].[NhomSanPham] ([maSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_CT_SanPham_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_CT_SanPham_Size] FOREIGN KEY([maSize])
REFERENCES [dbo].[Size] ([maSize])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_CT_SanPham_Size]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapLaiMatKhau]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CapLaiMatKhau]
(
@email varchar(150),
@password varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	update NguoiDung
	set password = CONVERT(VARBINARY(50),@password)
	where email = @email
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChinhSuaKhuyenMai] 
(
@maKM int,
@ngayApDung date,
@ngayHetHan date,
@moTa nvarchar(500),
@phanTramGiam int,
@maNV int
)
AS
BEGIN
	SET NOCOUNT ON;
	update CT_KhuyenMai
	set phanTramGiam = @phanTramGiam
	where maKM = @maKM

	update KhuyenMai
	set maNV = @maNV, ngayApDung = @ngayApDung, ngayHetHan = @ngayHetHan, moTa = @moTa
	where maKM = @maKM
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaNguoiDung]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChinhSuaNguoiDung] 
(
@maNguoiDung int,
@hoTen nvarchar(150),
@sdt varchar(20),
@email varchar(150),
@diaChi nvarchar(150),
@cmnd varchar(50),
@maQuyen int,
@trangThai int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update NguoiDung
	set hoTen= @hoTen, sdt = @sdt, email=@email, diaChi=@diaChi, cmnd=@cmnd, maQuyen = @maQuyen, trangThai=@trangThai
	where maNguoiDung=@maNguoiDung
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ChinhSuaSanPham]
(
-- Thông tin sản phẩm
@maSP int,
@tenSP nvarchar(150),
@maTL int,
@hinhAnh varchar(500),
@hinhAnh2 varchar(500),
@hinhAnh3 varchar(500),
@maNV int,
@moTa nvarchar(500),

-- Số Lượng Các Size
@SLSizeS int,
@SLSizeM int,
@SLSizeL int,
@SLSizeXL int,
@SLSizeXXL int,
-- Giá các size
@giaSizeS int,
@giaSizeM int,
@giaSizeL int,
@giaSizeXL int,
@giaSizeXXL int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tongSLTon int;
	declare @ngayCapNhat date = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);
	declare @tableMaCTSP table (maCT int, maSize int);

	set @tongSLTon = @SLSizeS + @SLSizeM + @SLSizeL + @SLSizeXL + @SLSizeXXL;

	update NhomSanPham
	set tenSP =@tenSP, maTL = @maTL, tongSLTon = @tongSLTon, ngayCapNhat = @ngayCapNhat, hinhAnh1 = @hinhAnh, hinhAnh2 = @hinhAnh2, hinhAnh3 = @hinhAnh3, moTa=@moTa
	where maSP = @maSP

	insert into @tableMaCTSP (maCT, maSize)
	select A.maCT, A.maSize
	from SanPham as A
	left join CT_PhieuNhap as B
	on A.maCT = B.maCTSP
	where A.maSP = @maSP

	-- Update Size S
	update CT_PhieuNhap
	set soLuongTon = @SLSizeS, gia=@giaSizeS
	where maCTSP = (select maCT from @tableMaCTSP where maSize=1)

	-- Update Size M
	update CT_PhieuNhap
	set soLuongTon = @SLSizeM, gia=@giaSizeM
	where maCTSP = (select maCT from @tableMaCTSP where maSize=2)

	-- Update Size L
	update CT_PhieuNhap
	set soLuongTon = @SLSizeL, gia=@giaSizeL
	where maCTSP = (select maCT from @tableMaCTSP where maSize=3)

	-- Update Size XL
	update CT_PhieuNhap
	set soLuongTon = @SLSizeXL, gia=@giaSizeXL
	where maCTSP = (select maCT from @tableMaCTSP where maSize=4)

	-- Update Size XXL
	update CT_PhieuNhap
	set soLuongTon = @SLSizeXXL, gia=@giaSizeXXL
	where maCTSP = (select maCT from @tableMaCTSP where maSize=5)

	update PhieuNhap
	set maNV = @maNV
	where maPN= (select maPhieuNhap from CT_PhieuNhap where maCTSP=((select maCT from @tableMaCTSP where maSize=5)))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaTheLoai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ChinhSuaTheLoai] 
(
@maTL int,
@tenTL nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	if exists (select * from TheLoai where tenTL = @tenTL)
	begin
		return 0
	end
	else
	begin
		UPDATE TheLoai set tenTL=@tenTL WHERE maTL=@maTL
		return 1
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DangNhap]
(
@email varchar(150),
@password varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	if exists (select * from NguoiDung where trangThai=1 AND email=@email AND HASHBYTES('SHA2_256', NguoiDung.password) = (select HASHBYTES('SHA2_256', @password)))
	begin
		select * from NguoiDung where email = @email
		return 1
	end
	else
		return 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DuyetDonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DuyetDonHang]
(
@maNVDuyet int,
@maDH int,
@trangThai int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tempTable table (maCTSP int, soLuong int, maSP int)
	declare @maHDMoi int
	if @trangThai =2
	begin
		update DonHang
		set maNVGiao = @maNVDuyet, ngayGiao = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]), trangThai=@trangThai
		where maDH = @maDH

		insert into HoaDon (maDH, ngayTao)
		values (@maDH, (SELECT CONVERT (Date, GETDATE()) AS [Current Date]))

		set @maHDMoi = (select max(maHoaDon) from HoaDon where maDH = @maDH)

		insert into PhieuTra (maHoaDon, ngayTao)
		values (@maHDMoi, (SELECT CONVERT (Date, GETDATE()) AS [Current Date]))

		select A.maCTSP, A.soLuong
		from CT_DonHang as A
		left join SanPham as B
		on A.maCTSP = B.maCT
		left join NhomSanPham as C
		on C.maSP = B.maSP
		left join DonHang as D
		on D.maDH = A.maDH
		where A.maDH = @maDH

		select max(maPhieuTra) as maHD from PhieuTra where maHoaDon = @maHDMoi
	end
	else
	begin
		update DonHang
		set maNVDuyet = @maNVDuyet, trangThai=@trangThai, ngayGiao = (SELECT CONVERT (Date, GETDATE()) AS [Current Date])
		where maDH = @maDH
	end

	if @trangThai = -1
	begin
		insert into @tempTable
		select A.maCTSP, A.soLuong, B.maSP
		from CT_DonHang as A
		left join SanPham as B
		on A.maCTSP = B.maCT
		left join NhomSanPham as C
		on C.maSP = B.maSP
		left join DonHang as D
		on D.maDH = A.maDH
		where A.maDH = @maDH

		insert into HoaDon (maDH, ngayTao)
		values (@maDH, (SELECT CONVERT (Date, GETDATE()) AS [Current Date]))

		set @maHDMoi = (select max(maHoaDon) from HoaDon where maDH = @maDH)

		update CT_PhieuNhap
		set soLuongTon += B.soLuong
		from @tempTable as B
		where B.maCTSP = CT_PhieuNhap.maCTSP

		update A
		set A.tongSLTon = A.tongSLTon + B.soLuong
		from NhomSanPham as A join (select sum(soLuong)as soLuong, maSP from @tempTable group by maSP) as B
		on A.maSP = B.maSP

		insert into PhieuTra (maHoaDon, ngayTao)
		values (@maHDMoi, (SELECT CONVERT (Date, GETDATE()) AS [Current Date]))

		select A.maCTSP, A.soLuong
		from CT_DonHang as A
		left join SanPham as B
		on A.maCTSP = B.maCT
		left join NhomSanPham as C
		on C.maSP = B.maSP
		left join DonHang as D
		on D.maDH = A.maDH
		where A.maDH = @maDH

		select max(maPhieuTra) as maHD from PhieuTra where maHoaDon = @maHDMoi
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraCMND]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_KiemTraCMND] 
(
@maNguoiDung int,
@cmnd varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;

	if @maNguoiDung != 0
	begin
		if exists (select * from NguoiDung where cmnd = @cmnd AND maNguoiDung =@maNguoiDung)
		begin
			return 1
		end
	end
	

   	if exists (select * from NguoiDung where cmnd=@cmnd AND maNguoiDung != @maNguoiDung)
	begin
		return 0
	end
	else
		return 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraEmail]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_KiemTraEmail]
(
@maNguoiDung int,
@email varchar(150)
)
AS
BEGIN
	SET NOCOUNT ON;
	if @maNguoiDung != 0
	begin
		if exists (select * from NguoiDung where email = @email AND maNguoiDung =@maNguoiDung)
		begin
			return 1
		end
	end
	

	if exists (select * from NguoiDung where email=@email AND maNguoiDung != @maNguoiDung)
	begin
		return 0
	end
	else
		return 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_KiemTraKhuyenMai] 
(
@maKM int,
@ngayApDung date,
@ngayHetHan date,
@maSP int,
@maSize int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @maCTSP int = (select maCT from SanPham where maSP=@maSP AND maSize = @maSize)
	if @maKM != 0
	begin
		if exists (select * from KhuyenMai where maKM in (select maKM from CT_KhuyenMai where maCTSP = @maCTSP) AND ngayApDung <= @ngayHetHan AND ngayHetHan >= @ngayApDung AND maKM != @maKM)
		begin
			return 0
		end
		else
		begin
			return 1
		end
	end
	else
	begin
		if exists (select * from KhuyenMai where maKM in (select maKM from CT_KhuyenMai where maCTSP = @maCTSP) AND ngayApDung <= @ngayHetHan AND ngayHetHan >= @ngayApDung)
		begin
			return 0
		end
		else
		begin
			return 1
		end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraSoDienThoai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Huynh Hoang Nghiep
-- Create date: 04/08/2022
-- Description:	Kiểm tra số điện thoại tồn tại
-- =============================================
CREATE PROCEDURE [dbo].[sp_KiemTraSoDienThoai]
(
@maNguoiDung int,
@sdt varchar(20)
)
AS
BEGIN
	if @maNguoiDung != 0
	begin
		if exists (select * from NguoiDung where sdt = @sdt AND maNguoiDung = @maNguoiDung)
		begin
			return 1
		end
	end
		
	if exists (select * from NguoiDung where sdt=@sdt AND maNguoiDung != @maNguoiDung)
	begin
		return 0
	end
	else
		return 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraThongTinNguoiDung]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KiemTraThongTinNguoiDung]
(
@email varchar(150),
@sdt varchar(20),
@cmnd varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	if exists (select * from NguoiDung where email=@email AND sdt = @sdt AND cmnd = @cmnd)
	begin
		return 1
	end
	else
	begin
		return 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayChiTietDonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LayChiTietDonHang]
(
@maDH int
)
AS
BEGIN
	SET NOCOUNT ON;
	select A.*, B.maSP, C.hinhAnh1, C.hinhAnh2, C.hinhAnh3, C.tenSP, B.maSize, D.maNVDuyet, D.maNVGiao, D.ngayTao, D.ngayGiao
	from CT_DonHang as A
	left join SanPham as B
	on A.maCTSP = B.maCT
	left join NhomSanPham as C
	on C.maSP = B.maSP
	left join DonHang as D
	on D.maDH = A.maDH
	where A.maDH = @maDH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayChiTietSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayChiTietSanPham]
(
@maSP int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tableGia table (maSP int,maCT int, maSize int, gia int, SLTon int)
	declare @tableCTSP table
	(maSP int, tenSP nvarchar(500), maTL int, ngayCapNhat date, hinhAnh varchar(500), hinhAnh2 varchar(500), hinhAnh3 varchar(500), trangThai tinyint, moTa nvarchar(500), luotXem int,
		maCTS int, maCTM int, maCTL int, maCTXL int, maCTXXL int,
		giaSizeS int, giaSizeM int, giaSizeL int, giaSizeXL int, giaSizeXXL int,
		SLSizeS int, SLSizeM int, SLSizeL int, SLSizeXL int, SLSizeXXL int)

		

		insert into @tableGia (maSP, maCT ,maSize, gia, SLTon)
		select A.maSP, A.maCT, A.maSize, B.gia, B.soLuongTon  from SanPham as A
		left join CT_PhieuNhap as B
		on A.maCT = B.maCTSP
		where A.maSP = @maSP

		insert into @tableCTSP (maSP, tenSP,maTL, ngayCapNhat, hinhAnh, hinhAnh2, hinhAnh3, trangThai, moTa, luotXem)
		select maSP, tenSP,maTL, ngayCapNhat, hinhAnh1, hinhAnh2, hinhAnh3, trangThai, moTa, luotXem
		from NhomSanPham
		where maSP = @maSP

		-- Size S
		update A
		set	A.giaSizeS = B.gia, A.SLSizeS = B.SLTon, a.maCTS = B.maCT
		from @tableCTSP as A
		inner join @tableGia as B
		on B.maSize = 1

		-- Size M
		update A
		set	A.giaSizeM = B.gia, A.SLSizeM = B.SLTon, A.maCTM = B.maCT 
		from @tableCTSP as A
		inner join @tableGia as B
		on B.maSize = 2

		-- Size L
		update A
		set	A.giaSizeL = B.gia, A.SLSizeL = B.SLTon, A.maCTL = B.maCT
		from @tableCTSP as A
		inner join @tableGia as B
		on B.maSize = 3

		-- Size XL
		update A
		set	A.giaSizeXL = B.gia, A.SLSizeXL = B.SLTon, A.maCTXL = B.maCT
		from @tableCTSP as A
		inner join @tableGia as B
		on B.maSize = 4

		-- Size XXL
		update A
		set	A.giaSizeXXL = B.gia, A.SLSizeXXL = B.SLTon, A.maCTXXL = B.maCT
		from @tableCTSP as A
		inner join @tableGia as B
		on B.maSize = 5

		update NhomSanPham
		set luotXem = luotXem+1
		where maSP = @maSP

		select * from @tableCTSP
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayDonHangTheoNguoiDung]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LayDonHangTheoNguoiDung]
(
@maNguoiDung int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tableOrders table (maDH int, soLuong int, gia int, ngayTao date, ngayGiao date, trangThai int)
	declare @tableDetail table (maDH int,soLuong int, gia int)

	insert into @tableOrders (maDH, ngayTao, ngayGiao, trangThai)
	select maDH, ngayTao, ngayGiao, trangThai from DonHang where maNguoiDung = @maNguoiDung

	insert into @tableDetail (maDH, soLuong, gia)
	select maDH,sum(soLuong), sum(gia*soLuong) from CT_DonHang
	group by maDH


	update A
	set A.soLuong = B.soLuong, A.gia = B.gia 
	from @tableOrders as A
	inner join @tableDetail as B
	on A.maDH = B.maDH

	select * from @tableOrders
	order by ngayTao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayKhuyenMaiTheoMaKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayKhuyenMaiTheoMaKhuyenMai]
(
@maKM int
)
AS
BEGIN
	SET NOCOUNT ON;
	select A.*, B.maCTSP, B.phanTramGiam, C.* from KhuyenMai as A
	left join CT_KhuyenMai as B
	on A.maKM = B.maKM
	left join (select N.*, M.gia from CT_PhieuNhap as M
	inner join	(select X.*, Y.tenSP, Y.hinhAnh1 from SanPham as X
	inner join NhomSanPham as Y
	on X.maSP = Y.maSP) as N
	on M.maCTSP = N.maCT) as C
	on C.maCT = B.maCTSP
	where A.maKM = @maKM
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayMaQuyenTheoTenQuyen]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Huynh Hoang Nghiep
-- Create date: 04/08/2022
-- Description:	Lấy mã quyền theo tên quyền
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayMaQuyenTheoTenQuyen] (@tenQuyen varchar(50))
AS
BEGIN
	select maQuyen from Quyen where tenQuyen=@tenQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LaySoLuongSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LaySoLuongSanPham]
(
@maCT int
)
AS
BEGIN
	SET NOCOUNT ON;
	select soLuongTon from CT_PhieuNhap
	where maCTSP = @maCT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoDonHangTheoNgay]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayToanBoDonHangTheoNgay]
(
@trangThai int,
@ngayBatDau date,
@ngayKetThuc date
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tableOrders table (maDH int, soLuong int, gia int, ngayTao date, ngayGiao date, trangThai int)
	declare @tableDetail table (maDH int,soLuong int, gia int)

	if @trangThai < 3
	begin
		insert into @tableOrders (maDH, ngayTao, ngayGiao, trangThai)
		select maDH, ngayTao, ngayGiao, trangThai from DonHang where trangThai = @trangThai
	end
	else
	begin
		insert into @tableOrders (maDH, ngayTao, ngayGiao, trangThai)
		select maDH, ngayTao, ngayGiao, trangThai from DonHang
	end

	insert into @tableDetail (maDH, soLuong, gia)
	select A.maDH, sum(soluong), sum(soLuong*gia)
	from(select * from CT_DonHang) as A
	group by maDH

	update A
	set A.soLuong = B.soLuong, A.gia = B.gia
	from @tableOrders as A
	inner join @tableDetail as B
	on A.maDH = B.maDH

	select * from @tableOrders
	where ngayGiao <= @ngayKetThuc AND ngayGiao>=@ngayBatDau
	order by ngayTao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoDonHangTheoTrangThai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayToanBoDonHangTheoTrangThai]
(
@trangThai int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tableOrders table (maDH int, soLuong int, gia int, ngayTao date, ngayGiao date, trangThai int)
	declare @tableDetail table (maDH int,soLuong int, gia int)

	if @trangThai < 3
	begin
		insert into @tableOrders (maDH, ngayTao, ngayGiao, trangThai)
		select maDH, ngayTao, ngayGiao, trangThai from DonHang where trangThai = @trangThai
	end
	else
	begin
		insert into @tableOrders (maDH, ngayTao, ngayGiao, trangThai)
		select maDH, ngayTao, ngayGiao, trangThai from DonHang
	end

	insert into @tableDetail (maDH, soLuong, gia)
	select A.maDH, sum(soluong), sum(soLuong*gia)
	from(select * from CT_DonHang) as A
	group by maDH

	update A
	set A.soLuong = B.soLuong, A.gia = B.gia
	from @tableOrders as A
	inner join @tableDetail as B
	on A.maDH = B.maDH

	select * from @tableOrders
	order by ngayTao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LayToanBoKhuyenMai]
(
@trangThai int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @ngayHienTai date = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);
	if @trangThai = 0
	begin
		select Y.*, D.tenSP, D.hinhAnh1 from (select X.*, C.maSP, C.maSize from (select A.maKM, A.ngayApDung, A.ngayHetHan, A.moTa, B.maCTSP, B.phanTramGiam from KhuyenMai as A
		inner join CT_KhuyenMai as B
		on A.maKM = B.maKM) as X inner join SanPham as C on C.maCT = X.maCTSP) as Y inner join NhomSanPham as D on Y.maSP = D.maSP where D.trangThai = 1
	end
	else if @trangThai = -1
	begin
		select Y.*, D.tenSP, D.hinhAnh1 from (select X.*, C.maSP, C.maSize from (select A.maKM, A.ngayApDung, A.ngayHetHan, A.moTa, B.maCTSP, B.phanTramGiam from KhuyenMai as A
		inner join CT_KhuyenMai as B on A.maKM = B.maKM AND A.ngayHetHan < @ngayHienTai) as X
		inner join SanPham as C on C.maCT = X.maCTSP) as Y inner join NhomSanPham as D on Y.maSP = D.maSP where D.trangThai = 1
	end
	else if @trangThai = 2
	begin
		select Y.*, D.tenSP, D.hinhAnh1 from (select X.*, C.maSP, C.maSize from (select A.maKM, A.ngayApDung, A.ngayHetHan, A.moTa, B.maCTSP, B.phanTramGiam from KhuyenMai as A
		inner join CT_KhuyenMai as B on A.maKM = B.maKM AND A.ngayApDung > @ngayHienTai) as X
		inner join SanPham as C on C.maCT = X.maCTSP) as Y inner join NhomSanPham as D on Y.maSP = D.maSP where D.trangThai = 1
	end
	else
	begin
		select Y.*, D.tenSP, D.hinhAnh1 from (select X.*, C.maSP, C.maSize from (select A.maKM, A.ngayApDung, A.ngayHetHan, A.moTa, B.maCTSP, B.phanTramGiam from KhuyenMai as A
		inner join CT_KhuyenMai as B on A.maKM = B.maKM AND A.ngayApDung <= @ngayHienTai AND A.ngayHetHan >= @ngayHienTai) as X
		inner join SanPham as C on C.maCT = X.maCTSP) as Y inner join NhomSanPham as D on Y.maSP = D.maSP where D.trangThai = 1
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoQuyen]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Huynh Hoang Nghiep
-- Create date: 04/08/2022
-- Description:	Lấy tất cả các quyền
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayToanBoQuyen]
AS
BEGIN
	select * from Quyen
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LayToanBoSanPham]
(
@trangThai int,
@maTL int,
@gia int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @tableCTSP table (maCT int,maSP int, gia int, luotXem int)
	declare @tableGia table (maSP int, giaThapNhat varchar(50), giaCaoNhat varchar(50), tenSP nvarchar(500), maTL int, tongSLTon int, ngayTao date, ngayCapNhat date, hinhAnh varchar(500), luotXem int, trangThai tinyint, moTa nvarchar(500))
	if @maTL = 0
		begin
			insert into @tableCTSP (maCT ,maSP)
			select SanPham.maCT, NhomSanPham.maSP
			from SanPham
			left join NhomSanPham
			on SanPham.maSP = NhomSanPham.maSP
		end
	else
		begin
			insert into @tableCTSP (maCT ,maSP)
			select SanPham.maCT, NhomSanPham.maSP
			from SanPham
			left join NhomSanPham
			on SanPham.maSP = NhomSanPham.maSP
			where NhomSanPham.maTL = @maTL
		end

	update A
	set A.gia = B.gia
	from @tableCTSP as A
	inner join CT_PhieuNhap as B
	on A.maCT = B.maCTSP

	if @maTL = 0
		begin
			insert into @tableGia (maSP, tenSP, maTL , tongSLTon , ngayTao , ngayCapNhat , hinhAnh, luotXem , trangThai , moTa)
			select maSP, tenSP, maTL , tongSLTon , ngayTao , ngayCapNhat , hinhAnh1, luotXem , trangThai , moTa from NhomSanPham where trangThai=@trangThai
		end
	else
		begin
			insert into @tableGia (maSP, tenSP, maTL , tongSLTon , ngayTao , ngayCapNhat , hinhAnh, luotXem , trangThai , moTa)
			select maSP, tenSP, maTL , tongSLTon , ngayTao , ngayCapNhat , hinhAnh1, luotXem , trangThai , moTa from NhomSanPham where trangThai=@trangThai AND maTL=@maTL
		end

	update A
	set A.giaThapNhat = n, A.giaCaoNhat = x
	from @tableGia A
	inner join (select maSP,min(gia) as n, max(gia) as x
	from @tableCTSP
	group by maSP) as B on B.maSP = A.maSP

	if @gia = 1
	begin
		select * from @tableGia where (giaCaoNhat >= 400000 OR giaThapNhat >= 400000) AND giaThapNhat is not NULL order by luotXem DESC
	end
	else if @gia != 0
	begin
		select * from @tableGia where (@gia - giaCaoNhat <= 100000 AND @gia - giaCaoNhat >= 0) OR (@gia - giaThapNhat<=100000 AND @gia - giaThapNhat>=0) AND giaThapNhat is not NULL  order by luotXem DESC
	end
	else
	begin
		select * from @tableGia where giaThapNhat is not NULL order by luotXem DESC
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayToanBoTheLoai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayToanBoTheLoai]
@trangThai int
AS
BEGIN
	SET NOCOUNT ON;
	declare @table table (maTL int, tenTL nvarchar(50), SLSanPham int)
	declare @tableSL table (maTL int, SL int)

	insert into @tableSL (maTL, SL)
	select maTL, count(maTL)
	from NhomSanPham
	where trangThai = 1
	group by maTL

	insert into @table (maTL, tenTL, SLSanPham)
	select	TheLoai.maTL,
			TheLoai.tenTL,
			CASE WHEN Table2.maTL is NULL THEN 0 else Table2.SL end as Table2
			from TheLoai left join @tableSL as Table2 on TheLoai.maTL = Table2.maTL
	where trangThai = @trangThai

	select * from @table

END
GO
/****** Object:  StoredProcedure [dbo].[sp_LocSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LocSanPham]
(
@giaMax int,
@giaMin int,
@maTheLoai int
)

AS
BEGIN
	SET NOCOUNT ON;
	if @maTheLoai = 0
		begin
			if (@giaMax = 0 AND @giaMin = 0)
				begin
					select * from SanPham
				end
			else if(@giaMin != 0 AND @giaMax = 0)
				begin
					select * from SanPham where gia >= @giaMin 
				end
			else
				begin
					select * from SanPham where (gia>=@giaMin AND gia <= @giaMax)
				end
		end
	else
		begin
			if (@giaMax = 0 AND @giaMin = 0)
				begin
					select * from SanPham where maTL = @maTheLoai
				end
			else if(@giaMin != 0 AND @giaMax = 0)
				begin
					select * from SanPham where gia >= @giaMin AND maTL = @maTheLoai
				end
			else
				begin
					select * from SanPham where (gia>=@giaMin AND gia <= @giaMax AND maTL = @maTheLoai)
				end
		end
			
END
GO
/****** Object:  StoredProcedure [dbo].[sp_NguoiDungCapNhatThongTin]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_NguoiDungCapNhatThongTin]
(
@maNguoiDung int,
@hoTen nvarchar(150),
@sdt varchar(20),
@email varchar(150),
@diaChi nvarchar(150),
@cmnd varchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update NguoiDung
	set hoTen= @hoTen, sdt = @sdt, email=@email, diaChi=@diaChi, cmnd=@cmnd
	where maNguoiDung=@maNguoiDung
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoChiTietDonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_TaoChiTietDonHang] 
(
@maDH int,
@maCTSP int,
@soLuong int,
@gia int
)
AS
BEGIN
	SET NOCOUNT ON;
	insert into CT_DonHang(maDH, maCTSP, soLuong, gia)
	values (@maDH, @maCTSP, @soLuong, @gia)

	update CT_PhieuNhap
	set soLuongTon = soLuongTon - @soLuong
	where maCTSP = @maCTSP

	update NhomSanPham
	set tongSLTon = tongSLTon - @soLuong
	where maSP = (select maSP from SanPham where maCT = @maCTSP)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoChiTietPhieuTra]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TaoChiTietPhieuTra] 
(
@maPhieuTra int,
@maCTSP int,
@soLuong int
)
AS
BEGIN
	SET NOCOUNT ON;
	insert into CT_PhieuTra (maPhieuTra, maCTSP, soLuong)
	values (@maPhieuTra, @maCTSP, @soLuong)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoDonHang]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TaoDonHang]
(
@maNguoiDung int,
@hoTen nvarchar(150),
@sdt varchar(20),
@email varchar(150),
@diaChi nvarchar(500)
)
AS
BEGIN
-- 0 Đã Được Đặt -- 1 Đã Được Duyệt -- 2 Đang Giao --- 3 Giao Thành Công -- -1 Giao Thất bại
	declare @ngayTao date
	SET NOCOUNT ON;
	set @ngayTao = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);

	insert into DonHang (maNguoiDung, hoTen, sdt, email, diaChi, ngayTao, trangThai)
	values (@maNguoiDung, @hoTen, @sdt, @email, @diaChi, @ngayTao, 0)

	select max(maDH) as maDH from DonHang where maNguoiDung = @maNguoiDung

END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TaoKhuyenMai]
(
@maNV int,
@ngayApDung date,
@ngayHetHan date,
@moTa nvarchar(500),
@maSP int,
@maSize int,
@phanTramGiam int,
@index int
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @maCTSP int = (select maCT from SanPham where maSP=@maSP AND maSize = @maSize)
	insert into KhuyenMai(maNV, ngayApDung, ngayHetHan, moTa)
	values (@maNV, @ngayApDung, @ngayHetHan, @moTa)
	
	declare @maKM int = (select max(maKM) from KhuyenMai)- @index
	insert into CT_KhuyenMai (maKM, maCTSP, phanTramGiam)
	values (@maKM,@maCTSP, @phanTramGiam)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoTaiKhoan]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Huynh Hoang Nghiep
-- Create date: 04/08/2022
-- Description:	Tạo tài khoản cho Khách Hàng
-- =============================================
CREATE PROCEDURE [dbo].[sp_TaoTaiKhoan]
(
--Thông tin user
@hoTen	nvarchar(150),
@sdt	varchar(20),
@email	varchar(150),
@diaChi	nvarchar(150),
@cmnd	varchar(50),
-- Thông tin tài khoản
@password varchar(50),
@maQuyen int
)
AS
BEGIN
	SET NOCOUNT ON;

	insert into NguoiDung( hoten, sdt, email, diaChi, cmnd, password, maQuyen, trangThai)
	values ( @hoten, @sdt, @email, @diaChi, @cmnd, CAST(@password AS VARBINARY(50)), @maQuyen,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Huynh Hoang Nghiep
-- Create date: 05/08/2022
-- Description:	Thêm 1 Sản Phẩm
-- =============================================
CREATE PROCEDURE [dbo].[sp_ThemSanPham]
(
-- Thông tin sản phẩm
--@maSP int,
@tenSP nvarchar(150),
@maTL int,
@hinhAnh varchar(500),
@hinhAnh2 varchar(500),
@hinhAnh3 varchar(500),
@maNV int,

-- Số Lượng Các Size
@SLSizeS int,
@SLSizeM int,
@SLSizeL int,
@SLSizeXL int,
@SLSizeXXL int,
-- Giá các size
@giaSizeS int,
@giaSizeM int,
@giaSizeL int,
@giaSizeXL int,
@giaSizeXXL int,

--maSP int ( Lấy ở trên Thông tin sản phẩm )
@moTa nvarchar(500)
)
AS
BEGIN
Declare @maSPMoi int, @maPhieuNhapMoi int, @luotXem int, @tongSLTon int, @ngayCapNhat date, @ngayTao date;
	SET NOCOUNT ON;
	set @ngayCapNhat = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);
	set @ngayTao = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);
	set @luotXem=0;
	set @tongSLTon = @SLSizeS + @SLSizeM + @SLSizeL + @SLSizeXL + @SLSizeXXL;

	insert into NhomSanPham(tenSP, maTL, tongSLTon, luotXem, ngayTao, ngayCapNhat, hinhAnh1,hinhAnh2, hinhAnh3, trangThai, moTa)
	values (@tenSP, @maTL, @tongSLTon, @luotXem, @ngayTao, @ngayCapNhat, @hinhAnh,@hinhAnh2, @hinhAnh3, 1, @moTa)

	set @maSPMoi = (select max(maSP) from NhomSanPham)

	insert into PhieuNhap(ngayTao, maNV)
	values(@ngayTao, @maNV)

	set @maPhieuNhapMoi = (select max(maPN) from PhieuNhap)

	--Thêm Size S
	exec sp_ThemSanPhamTheoSize @maSPMoi, 1, @giaSizeS, @SLSizeS, @maPhieuNhapMoi
	--Thêm Size M
	exec sp_ThemSanPhamTheoSize @maSPMoi, 2, @giaSizeM, @SLSizeM,@maPhieuNhapMoi
	--Thêm Size L
	exec sp_ThemSanPhamTheoSize @maSPMoi, 3, @giaSizeL, @SLSizeL,@maPhieuNhapMoi
	--Thêm Size XL
	exec sp_ThemSanPhamTheoSize @maSPMoi, 4, @giaSizeXL, @SLSizeXL,@maPhieuNhapMoi
	--Thêm Size XXL
	exec sp_ThemSanPhamTheoSize @maSPMoi, 5, @giaSizeXXL, @SLSizeXXL,@maPhieuNhapMoi

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPhamTheoSize]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ThemSanPhamTheoSize]
(
	@maSPMoi int,
	@maSize int,
	@gia int,
	@soLuong int,
	@maPhieuNhapMoi int
)
AS
BEGIN
	SET NOCOUNT ON;

	-- Thêm Chi Tiết Sản Phẩm
	insert into SanPham(maSP, maSize)
	values (@maSPMoi, @maSize)

	-- Thêm Chi Tiết Sản Phẩm
	insert into CT_PhieuNhap(maPhieuNhap, maCTSP, soLuongTon, gia)
	values (@maPhieuNhapMoi, (select max(maCT) from SanPham), @soLuong, @gia)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTheLoai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ThemTheLoai] 
(
@tenTL nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if exists (select * from TheLoai where tenTL = @tenTL)
	begin
		return 0
	end
	else
	begin
		insert into TheLoai (tenTL, trangThai) values (@tenTL, 1)
		return 1
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemKhuyenMai]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemKhuyenMai] 
(
@tenSP nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @ngayHienTai date = (SELECT CONVERT (Date, GETDATE()) AS [Current Date]);
	declare @tenSanPhamCanTim nvarchar(150) = '%' + @tenSP +'%'

	select TOP 10 A.*, B.maNV, B.ngayApDung, B.ngayHetHan, B.moTa, C.*, D.hinhAnh1 from CT_KhuyenMai as A
	left join KhuyenMai as B
	on A.maKM = B.maKM
	left join	(select N.*, M.gia from CT_PhieuNhap as M
			inner join	(select X.*, Y.tenSP from SanPham as X
			inner join NhomSanPham as Y
			on X.maSP = Y.maSP) as N
			on M.maCTSP = N.maCT) as C
	on C.maCT = A.maCTSP
	left join NhomSanPham as D
	on D.maSP = C.maSP
	where B.ngayHetHan >= @ngayHienTai AND A.maCTSP in (select maCT from SanPham where maSP in (select maSP from NhomSanPham where tenSP Like @tenSanPhamCanTim))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- Tìm kiếm sản phẩm theo tên
CREATE PROCEDURE [dbo].[sp_TimKiemSanPham]
(
@tenSP nvarchar(150),
@trangThai int
)
AS
BEGIN
	Declare @tenSanPhamCanTim nvarchar(150)
	SET NOCOUNT ON;
	set @tenSanPhamCanTim = '%' + @tenSP +'%'
	select TOP 10 * from NhomSanPham where tenSP Like @tenSanPhamCanTim AND trangThai = @trangThai

END
GO
/****** Object:  StoredProcedure [dbo].[sp_XemSanPham]    Script Date: 9/17/2022 4:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_XemSanPham]
(
@maSP int
)
AS
BEGIN
   declare @luotXem int
	SET NOCOUNT ON;
	set @luotXem = (select luotXem from NhomSanPham where maSP = @maSP) + 1

	update NhomSanPham
	set luotXem = @luotXem
	where maSP = @maSP
	

	select * from SanPham where maSP = @maSP
END
GO
USE [master]
GO
ALTER DATABASE [DB_ClothingWebsite] SET  READ_WRITE 
GO
