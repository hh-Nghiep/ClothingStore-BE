var config = require('../config/db.config')
const sql = require('mssql')

async function getAllProduct(values) {
    try {
        let pool = await sql.connect(config);
        let products = await pool.request()
            .input('trangThai', sql.Int, values.body.trangThai)
            .input('maTL', sql.Int, values.body.maTL)
            .input('gia', sql.Int, values.body.gia)
            .execute("sp_LayToanBoSanPham");
        return products.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function addProduct(values) {
    try {
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('tenSP', sql.NVarChar, values.body.tenSP)
            .input('maTL', sql.Int, values.body.maTL)
            .input('hinhAnh', sql.VarChar, values.body.hinhAnh)
            .input('maNV', sql.VarChar, values.body.maNV)
            .input('SLSizeS', sql.Int, values.body.SLSizeS)
            .input('SLSizeM', sql.Int, values.body.SLSizeM)
            .input('SLSizeL', sql.Int, values.body.SLSizeL)
            .input('SLSizeXL', sql.Int, values.body.SLSizeXL)
            .input('SLSizeXXL', sql.Int, values.body.SLSizeXXL)
            .input('giaSizeS', sql.Int, values.body.giaSizeS)
            .input('giaSizeM', sql.Int, values.body.giaSizeM)
            .input('giaSizeL', sql.Int, values.body.giaSizeL)
            .input('giaSizeXL', sql.Int, values.body.giaSizeXL)
            .input('giaSizeXXL', sql.Int, values.body.giaSizeXXL)
            .input('moTa', sql.NVarChar, values.body.moTa)
            .execute('sp_ThemSanPham');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function deleteProduct(values) {
    try {
        let pool = await sql.connect(config);
        let deleteProduct = await pool.request()
            .input('trangThai', sql.Int, 0)
            .input('maSP', sql.Int, values.body.maSP)
            .query('UPDATE NhomSanPham set trangThai=@trangThai WHERE maSP=@maSP');
        return deleteProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getProductWithId(id) {
    try {
        let pool = await sql.connect(config);
        let deleteProduct = await pool.request()
            .input('maSP', sql.Int, id)
            .execute('sp_LayChiTietSanPham');
        return deleteProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function editProduct(values) {
    try {
        let pool = await sql.connect(config);
        let deleteProduct = await pool.request()
            .input('maSP', sql.Int, values.body.maSP)
            .input('tenSP', sql.NVarChar, values.body.tenSP)
            .input('maTL', sql.Int, values.body.maTL)
            .input('hinhAnh', sql.VarChar, values.body.hinhAnh)
            .input('maNV', sql.VarChar, values.body.maNV)
            .input('moTa', sql.NVarChar, values.body.moTa)
            .input('SLSizeS', sql.Int, values.body.SLSizeS)
            .input('SLSizeM', sql.Int, values.body.SLSizeM)
            .input('SLSizeL', sql.Int, values.body.SLSizeL)
            .input('SLSizeXL', sql.Int, values.body.SLSizeXL)
            .input('SLSizeXXL', sql.Int, values.body.SLSizeXXL)
            .input('giaSizeS', sql.Int, values.body.giaSizeS)
            .input('giaSizeM', sql.Int, values.body.giaSizeM)
            .input('giaSizeL', sql.Int, values.body.giaSizeL)
            .input('giaSizeXL', sql.Int, values.body.giaSizeXL)
            .input('giaSizeXXL', sql.Int, values.body.giaSizeXXL)
            .execute('sp_ChinhSuaSanPham');
        return deleteProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function activateProduct(values) {
    try {
        let pool = await sql.connect(config);
        let activateProduct = await pool.request()
            .input('trangThai', sql.Int, 1)
            .input('maSP', sql.Int, values.body.maSP)
            .query('UPDATE NhomSanPham set trangThai=@trangThai WHERE maSP=@maSP');
        return activateProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getAmountProductWithId(id) {
    try {
        let pool = await sql.connect(config);
        let amount = await pool.request()
            .input('maCT', sql.Int, id)
            .execute('sp_LaySoLuongSanPham');
        return amount.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function findProductWithName(values) {
    try {
        let pool = await sql.connect(config);
        let product = await pool.request()
            .input('tenSP', sql.NVarChar, values.body.tenSP)
            .input('trangThai', sql.Int, values.body.trangThai)
            .execute('sp_TimKiemSanPham');
        return product.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

module.exports = {
    getAllProduct: getAllProduct,
    addProduct: addProduct,
    deleteProduct: deleteProduct,
    getProductWithId: getProductWithId,
    editProduct: editProduct,
    activateProduct: activateProduct,
    getAmountProductWithId: getAmountProductWithId,
    findProductWithName: findProductWithName,

}