class DonHang {
    constructor(maDonHang, maNguoiDung, hoTen, sdt, email, diaChi, ngayTao, ngayGiao, trangThai, maNVDuyet, maNVGiao) {
        this.maDonHang = maDonHang;
        this.maNguoiDung = maNguoiDung;
        this.hoTen = hoTen;
        this.sdt = sdt;
        this.email = email;
        this.diaChi = diaChi;
        this.ngayTao = ngayTao;
        this.ngayGiao = ngayGiao;
        this.trangThai = trangThai;
        this.maNVDuyet = maNVDuyet;
        this.maNVGiao = maNVGiao;
    }
}

module.exports = DonHang;
