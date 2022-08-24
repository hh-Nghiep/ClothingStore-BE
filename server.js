
// Setting API
require('dotenv').config();
var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('./server', router);


// router
require('./app/routes/CT_DonHang.routes')(app);
require('./app/routes/CT_KhuyenMai.routes')(app);
require('./app/routes/CT_PhieuNhap.routes')(app);
require('./app/routes/CT_PhieuTra.routes')(app);
require('./app/routes/CT_SanPham.routes')(app);
require('./app/routes/DonHang.routes')(app);
require('./app/routes/HoaDon.routes')(app);
require('./app/routes/NguoiDung.routes')(app);
require('./app/routes/PhieuNhap.routes')(app);
require('./app/routes/PhieuTra.routes')(app);
require('./app/routes/Quyen.routes')(app);
require('./app/routes/SanPham.routes')(app);
require('./app/routes/Size.routes')(app);
require('./app/routes/TheLoai.routes')(app);

var port = process.env.PORT || 3000;
app.listen(port, () => console.log('API is runnning at ' + port));