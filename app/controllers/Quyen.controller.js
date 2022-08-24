var config = require('../config/db.config')
const sql = require('mssql')

async function getAllRole() {
    try {
        let pool = await sql.connect(config);
        let quyen = await pool.request().execute("sp_LayToanBoQuyen");
        console.log(quyen)
        return quyen.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getIdRoleWithName(values) {
    try {
        console.log(values)
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('maKH', sql.Int, values.maKH)
            .input('hoTen', sql.NVarChar, values.hoTen)
            .input('sdt', sql.VarChar, values.sdt)
            .input('email', sql.VarChar, values.email)
            .input('diaChi', sql.VarChar, values.diaChi)
            .input('maNVDuyet', sql.VarChar, values.maNVDuyet)
            .execute("sp_TaoDonHang");
        return result.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function TEST(values) {
    try {
        console.log(values)
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('maCTSP', sql.Int, values.maCTSP)
            .input('soLuong', sql.Int, values.soLuong)
            .execute("sp_KiemTraSoLuongSanPham");

        console.log("recordsets", result.returnValue)
        return result.returnValue;
    }
    catch (error) {
        console.log(error);
    }
}

async function AddRole(tenQuyen) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('tenQuyen', sql.VarChar, tenQuyen.Title)
            .execute('InsertOrders');


        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}


module.exports = {
    getAllRole: getAllRole,
    getIdRoleWithName: getIdRoleWithName,
    TEST: TEST,
}