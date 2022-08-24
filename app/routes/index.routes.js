const express = require('express');
const { CT_DonHang } = require('./CT_DonHang.routes');
const { CT_KhuyenMai } = require('./CT_KhuyenMai.routes');
const { CT_PhieuNhap } = require('./CT_PhieuNhap.routes');
const { CT_PhieuTra } = require('./CT_PhieuTra.routes');
const { CT_SanPham } = require('./CT_SanPham.routes');
const { DonHang } = require('./DonHang.routes');
const { NguoiDung } = require('./NguoiDung.routes');
const { KhuyenMai } = require('./KhuyenMai.routes');
const { PhieuNhap } = require('./PhieuNhap.routes');
const { PhieuTra } = require('./PhieuTra.routes');
const { Quyen } = require('./Quyen.routes');
const { SanPham } = require('./SanPham.routes');
const { Size } = require('./Size.routes');
const { TaiKhoan } = require('./TaiKhoan.routes');
const { TheLoai } = require('./TheLoai.routes');
const rootRouter = express.Router();
const arr =
    [
        "/api/CT_DonHang",
        "/api/CT_KhuyenMai",
        "/api/CT_PhieuNhap",
        "/api/CT_PhieuTra",
        "/api/CT_SanPham",
        "/api/DonHang",
        "/api/KhuyenMai",
        "/api/NguoiDung",
        "/api/PhieuNhap",
        "/api/PhieuTra",
        "/api/Quyen",
        "/api/Size",
        "/api/SanPham",
        "/api/TaiKhoan",
        "/api/TheLoai",
    ]

rootRouter.use('/api', (req, res) => {
    return res.send(arr);
})
rootRouter.use('/CT_DonHang', CT_DonHang);
rootRouter.use('/CT_KhuyenMai', CT_KhuyenMai);
rootRouter.use('/CT_PhieuNhap', CT_PhieuNhap);
rootRouter.use('/CT_PhieuTra', CT_PhieuTra);
rootRouter.use('/CT_SanPham', CT_SanPham);
rootRouter.use('/DonHang', DonHang);
rootRouter.use('/KhuyenMai', KhuyenMai);
rootRouter.use('/NguoiDung', NguoiDung);
rootRouter.use('/PhieuNhap', PhieuNhap);
rootRouter.use('/PhieuTra', PhieuTra);
rootRouter.use('/Quyen', Quyen);
rootRouter.use('/Size', Size);
rootRouter.use('/SanPham', SanPham);
rootRouter.use('/TheLoai', TheLoai);


module.exports = {
    rootRouter
}