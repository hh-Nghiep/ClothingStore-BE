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
            .input('index', sql.Int, values.body.index)
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
    console.log(values.body)
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('maKM', sql.Int, values.body.maKM)
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

async function findSaleWithName(values) {
    console.log(values.body)
    try {
        let pool = await sql.connect(config);
        let product = await pool.request()
            .input('tenSP', sql.NVarChar, values.body.tenSP)
            .execute('sp_TimKiemKhuyenMai');
        return product.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function editSale(values) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .input('maKM', sql.Int, values.body.maKM)
            .input('ngayApDung', sql.Date, values.body.ngayApDung)
            .input('ngayHetHan', sql.Date, values.body.ngayHetHan)
            .input('moTa', sql.NVarChar, values.body.moTa)
            .input('phanTramGiam', sql.Int, values.body.phanTramGiam)
            .input('maNV', sql.Int, values.body.maNV)
            .execute("sp_ChinhSuaKhuyenMai  ");
        return sale.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function findSaleWithId(maKm) {
    try {
        let pool = await sql.connect(config);
        let product = await pool.request()
            .input('maKM', sql.Int, maKm)
            .execute('sp_LayKhuyenMaiTheoMaKhuyenMai');
        return product.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

module.exports = {
    AddSale: AddSale,
    getAllSale: getAllSale,
    deleteSale: deleteSale,
    checkSaleExists: checkSaleExists,
    findSaleWithName: findSaleWithName,
    editSale: editSale,
    findSaleWithId: findSaleWithId
}