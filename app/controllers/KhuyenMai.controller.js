var config = require('../config/db.config')
const sql = require('mssql')

async function AddSale(values) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('maNV', sql.Int, values.body.maNV)
            .input('ngayApDung', sql.Date, values.body.ngayApDung)
            .input('ngayHetHan', sql.Date, values.body.ngayHetHan)
            .input('moTa', sql.NVarChar, values.body.moTa)
            .input('maSP', sql.Int, values.body.maSP)
            .input('maSize', sql.Int, values.body.maSize)
            .input('phanTramGiam', sql.Int, values.body.phanTramGiam)
            .execute("sp_TaoKhuyenMai");
        return sale;
    }
    catch (error) {
        console.log(error);
    }
}

async function getAllSale(values) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('trangThai', sql.Int, values.body.trangThai)
            .execute("sp_LayToanBoKhuyenMai");
        return sale.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function deleteSale(maKM) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('maKM', sql.Int, maKM)
            .query("delete CT_KhuyenMai where maKM = @maKM delete KhuyenMai where maKM = @maKM");
        return sale.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function checkSaleExists(values) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('ngayApDung', sql.Date, values.body.ngayApDung)
            .input('ngayHetHan', sql.Date, values.body.ngayHetHan)
            .input('maSP', sql.Int, values.body.maSP)
            .input('maSize', sql.Int, values.body.maSize)
            .execute("sp_KiemTraKhuyenMai ");
        return sale;
    }
    catch (error) {
        console.log(error);
    }
}

module.exports = {
    AddSale: AddSale,
    getAllSale: getAllSale,
    deleteSale: deleteSale,
    checkSaleExists: checkSaleExists,

}