var config = require('../config/db.config')
const sql = require('mssql')

async function getUserByRole(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('maQuyen', sql.Int, values.body.maQuyen)
            .input('trangThai', sql.Int, values.body.trangThai)
            .query("select * from NguoiDung where maQuyen=@maQuyen AND trangThai=@trangThai");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getUserById(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .query("select * from NguoiDung where maNguoiDung=@maNguoiDung");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function updateUser(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .input('hoTen', sql.NVarChar, values.body.hoTen.trim())
            .input('sdt', sql.VarChar, values.body.sdt)
            .input('email', sql.VarChar, values.body.email)
            .input('diaChi', sql.NVarChar, values.body.diaChi)
            .input('cmnd', sql.VarChar, values.body.cmnd)
            .input('maQuyen', sql.Int, values.body.maQuyen)
            .input('trangThai', sql.Int, values.body.trangThai)
            .execute("sp_ChinhSuaNguoiDung");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function userUpdateInfo(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .input('hoTen', sql.NVarChar, values.body.hoTen.trim())
            .input('sdt', sql.VarChar, values.body.sdt)
            .input('email', sql.VarChar, values.body.email)
            .input('diaChi', sql.NVarChar, values.body.diaChi)
            .input('cmnd', sql.VarChar, values.body.cmnd)
            .execute("sp_NguoiDungCapNhatThongTin");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function updatePassword(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('email', sql.VarChar, values.body.email)
            .input('password', sql.VarChar, values.body.password)
            .execute("sp_CapLaiMatKhau");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function addUser(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('hoTen', sql.NVarChar, values.body.hoTen.trim())
            .input('sdt', sql.VarChar, values.body.sdt)
            .input('email', sql.VarChar, values.body.email)
            .input('diaChi', sql.NVarChar, values.body.diaChi)
            .input('cmnd', sql.VarChar, values.body.cmnd)
            .input('password', sql.VarChar, values.body.password)
            .input('maQuyen', sql.Int, values.body.maQuyen)
            .execute("sp_TaoTaiKhoan");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function disableUser(values) {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request()
            .input('trangThai', sql.Int, 0)
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .query("UPDATE NguoiDung set trangThai=@trangThai where maNguoiDung=@maNguoiDung");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function login(values) {
    try {
        let pool = await sql.connect(config);
        let user = await pool.request()
            .input('email', sql.NVarChar, values.body.email)
            .input('password', sql.VarChar, values.body.password)
            .execute("sp_DangNhap");
        if (user.returnValue === 1) {
            return user.recordsets;
        } else {
            return 0;
        }

    }
    catch (error) {
        console.log(error);
    }
}

async function checkPhone(values) {
    try {
        let pool = await sql.connect(config);
        let userPhone = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .input('sdt', sql.VarChar, values.body.sdt)
            .execute("sp_KiemTraSoDienThoai");
        if (userPhone.returnValue === 1) {
            return 1;
        } else {
            return 0;
        }
    }
    catch (error) {
        console.log(error);
    }
}

async function checkEmail(values) {
    try {
        let pool = await sql.connect(config);
        let userEmail = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .input('email', sql.VarChar, values.body.email)
            .execute("sp_KiemTraEmail");
        if (userEmail.returnValue === 1) {
            return 1;
        } else {
            return 0;
        }
    }
    catch (error) {
        console.log(error);
    }
}

async function checkId(values) {
    try {
        let pool = await sql.connect(config);
        let userId = await pool.request()
            .input('maNguoiDung', sql.Int, values.body.maNguoiDung)
            .input('cmnd', sql.VarChar, values.body.cmnd)
            .execute("sp_KiemTraCMND");
        if (userId.returnValue === 1) {
            return 1;
        } else {
            return 0;
        }
    }
    catch (error) {
        console.log(error);
    }
}

async function findUserWitdEmail(values) {
    try {
        var sqlqr = `SELECT TOP 10 * FROM NguoiDung Where email Like '%${values}%'`
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
    getUserByRole: getUserByRole,
    getUserById: getUserById,
    updateUser: updateUser,
    disableUser: disableUser,
    addUser: addUser,
    login: login,
    checkPhone: checkPhone,
    checkEmail: checkEmail,
    checkId: checkId,
    updatePassword: updatePassword,
    userUpdateInfo: userUpdateInfo,
    findUserWitdEmail: findUserWitdEmail
}