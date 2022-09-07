var config = require('../config/db.config')
const sql = require('mssql')

async function addOrder(values) {
    try {
        let pool = await sql.connect(config);
        let insertOrder = await pool.request()
            .input('maNguoiDung', sql.VarChar, values.body.maNguoiDung)
            .input('hoTen', sql.NVarChar, values.body.hoTen)
            .input('sdt', sql.VarChar, values.body.sdt)
            .input('email', sql.VarChar, values.body.email)
            .input('diaChi', sql.NVarChar, values.body.diaChi)
            .execute('sp_TaoDonHang');
        return insertOrder.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function addDetailOrder(values) {
    try {
        let pool = await sql.connect(config);
        let insertDetailOrder = await pool.request()
            .input('maDH', sql.Int, values.body.maDH)
            .input('maCTSP', sql.Int, values.body.maCTSP)
            .input('soLuong', sql.Int, values.body.soLuong)
            .input('gia', sql.Int, values.body.gia)
            .execute('sp_TaoChiTietDonHang');
        return insertDetailOrder.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getAllOrder() {
    try {
        let pool = await sql.connect(config);
        let order = await pool.request()
            .query('SELECT * FROM DonHang');
        return order.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getAllOrderWithId(values) {
    try {
        let pool = await sql.connect(config);
        let insertDetailOrder = await pool.request()
            .input('maNguoiDung', sql.VarChar, values.body.maNguoiDung)
            .execute('sp_LayDonHangTheoNguoiDung');
        return insertDetailOrder.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getAllOrderWithStatus(status) {
    try {
        let pool = await sql.connect(config);
        let insertDetailOrder = await pool.request()
            .input('trangThai', sql.Int, status)
            .execute('sp_LayToanBoDonHangTheoTrangThai');
        return insertDetailOrder.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function updateStatusOrder(values) {
    try {
        let pool = await sql.connect(config);
        let updateStatus = await pool.request()
            .input('maNVDuyet', sql.VarChar, values.body.maNVDuyet)
            .input('maDH', sql.Int, values.body.maDH)
            .input('trangThai', sql.Int, values.body.trangThai)
            .execute('sp_DuyetDonHang');
        return updateStatus.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function confirmOrder(values) {
    try {
        let pool = await sql.connect(config);
        let updateStatus = await pool.request()
            .input('maNVGiao', sql.VarChar, values.body.maNVGiao)
            .input('maDH', sql.Int, values.body.maDH)
            .execute('sp_XacNhanGiaoHangThanhCong');
        return updateStatus.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getDetailOrder(id) {
    try {
        let pool = await sql.connect(config);
        let updateStatus = await pool.request()
            .input('maDH', sql.Int, id)
            .execute('sp_LayChiTietDonHang');
        return updateStatus.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function addDetailReturnBill(values) {
    try {
        let pool = await sql.connect(config);
        let detailReturn = await pool.request()
            .input('maPhieuTra', sql.Int, values.body.maPhieuTra)
            .input('maCTSP', sql.Int, values.body.maCTSP)
            .input('soLuong', sql.Int, values.body.soLuong)
            .execute('sp_TaoChiTietPhieuTra');
        return detailReturn.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function findOrderWitdId(values) {
    try {
        var sqlqr = `SELECT TOP 10 * FROM DonHang Where maDH Like '%${values}%'`
        let pool = await sql.connect(config);
        let detailReturn = await pool.request()
            .query(sqlqr);
        return detailReturn.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

module.exports = {
    getAllOrder: getAllOrder,
    addOrder: addOrder,
    addDetailOrder: addDetailOrder,
    getAllOrderWithId: getAllOrderWithId,
    updateStatusOrder: updateStatusOrder,
    getAllOrderWithStatus: getAllOrderWithStatus,
    confirmOrder: confirmOrder,
    getDetailOrder: getDetailOrder,
    addDetailReturnBill: addDetailReturnBill,
    findOrderWitdId: findOrderWitdId,
}