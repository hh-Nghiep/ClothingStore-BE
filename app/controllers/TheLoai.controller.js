var config = require('../config/db.config')
const sql = require('mssql')


async function GetAllCategoryWithStatus(trangThai) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('trangThai', sql.Int, trangThai)
            .execute('sp_LayToanBoTheLoai');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function UpdateCateGory(values) {
    try {
        let pool = await sql.connect(config);
        let cate = await pool.request()
            .input('maTL', sql.Int, values.body.maTL)
            .input('tenTL', sql.NVarChar, values.body.tenTL)
            .execute('sp_ChinhSuaTheLoai ');
        return cate.returnValue;
    }
    catch (err) {
        console.log(err);
    }
}

async function AddCategory(values) {
    try {
        let pool = await sql.connect(config);
        let cate = await pool.request()
            .input('tenTL', sql.NVarChar, values.body.tenTL)
            .execute('sp_ThemTheLoai ');
        return cate.returnValue;
    }
    catch (err) {
        console.log(err);
    }
}

async function UpdateStatusCategory(values) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('trangThai', sql.Int, values.body.trangThai)
            .input('maTL', sql.Int, values.body.maTL)
            .query('UPDATE TheLoai set trangThai=@trangThai WHERE maTL = @maTL');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}



module.exports = {
    GetAllCategoryWithStatus: GetAllCategoryWithStatus,
    AddCategory: AddCategory,
    UpdateCateGory: UpdateCateGory,
    UpdateStatusCategory: UpdateStatusCategory,
}