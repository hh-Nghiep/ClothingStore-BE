const mongoose = require("mongoose");
mongoose.Promise = global.Promise;

const db = {};

db.mongoose = mongoose;

db.user = require("./user.model");
db.role = require("./role.model");
db.contract = require("./contract.model");
db.annualLeave = require("./annual-leave.model");
db.menu = require("./menu.model");
db.product = require("./product.model")
db.order = require("./order.model")
db.cart = require("./cart.model")
module.exports = db;
