var config = require('../config/db.config')
const sql = require('mssql')


async function GetAllCateGory(tenQuyen) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
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
        let insertProduct = await pool.request()
            .input('maTL', sql.Int, values.body.maTL)
            .input('tenTL', sql.NVarChar, values.body.tenTL)
            .query('UPDATE TheLoai set tenTL=@tenTL WHERE maTL=@maTL');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function AddCategory(values) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('tenTL', sql.NVarChar, values.body.tenTheLoai)
            .query('insert into TheLoai (tenTL) values (@tenTL)');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function DeleteCategory(values) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('maTL', sql.Int, values.body.maTL)
            .query('DELETE FROM TheLoai WHERE maTL = @maTL');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}


module.exports = {
    GetAllCateGory: GetAllCateGory,
    AddCategory: AddCategory,
    UpdateCateGory: UpdateCateGory,
    DeleteCategory: DeleteCategory,
}