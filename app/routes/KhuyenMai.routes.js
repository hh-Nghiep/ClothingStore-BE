var Controller = require('../controllers/KhuyenMai.controller');
var Model = require('./../models/KhuyenMai.model');

module.exports = (app) => {
    app.post('/sale/add', (request, response) => {
        Controller.AddSale(request).then(result => {
            response.json(result.returnValue);
        })
    })

    app.post('/sales', (request, response) => {
        var amount = 10;
        var page = parseInt(request.query.page);
        Controller.getAllSale(request).then(result => {
            if (page === 0) {
                response.json(result);
            } else {
                var data = {
                    data: result[0].slice(((page - 1) * amount), (page * amount)),
                    totalPage: Math.ceil(result[0].length / 12)
                }
                response.json(data);
            }

        })
    })

    app.delete('/sale/delete/:id', (request, response) => {
        Controller.deleteSale(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.post('/sale/check', (request, response) => {
        Controller.checkSaleExists(request).then(result => {
            response.json(result.returnValue);
        })
    })
}