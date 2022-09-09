var Controller = require('../controllers/DonHang.controller');
var Model = require('./../models/DonHang.model');

module.exports = (app) => {
    app.get('/orders', (request, response) => {
        Controller.getAllOrder().then(result => {
            response.json(result);
        })
    })

    app.post('/order/add', (request, response) => {
        Controller.addOrder(request).then(result => {
            response.json(result);
        })
    })

    app.get('/order/status/:id', (request, response) => {
        var amount = 10;
        var page = parseInt(request.query.page);
        Controller.getAllOrderWithStatus(request.params.id).then(result => {
            var data = {
                data: result[0].slice(((page - 1) * amount), (page * amount)),
                totalPage: Math.ceil(result[0].length / amount)
            }
            response.json(data);
        })
    })

    app.post('/order/addDetail', (request, response) => {
        Controller.addDetailOrder(request).then(result => {
            response.json(result);
        })
    })

    app.post('/order/id', (request, response) => {
        var amount = 8;
        var page = parseInt(request.query.page);
        Controller.getAllOrderWithId(request).then(result => {
            var data = {
                data: result[0].slice(((page - 1) * amount), (page * amount)),
                totalPage: Math.ceil(result[0].length / amount)
            }
            response.json(data);
        })
    })

    app.post('/order/update', (request, response) => {
        Controller.updateStatusOrder(request).then(result => {
            response.json(result);
        })
    })

    app.post('/order/confirm', (request, response) => {
        Controller.confirmOrder(request).then(result => {
            response.json(result);
        })
    })

    app.get('/order/detail/:id', (request, response) => {
        Controller.getDetailOrder(request.params.id).then(result => {
            response.json(result);
        })
    })


    app.post('/order/return', (request, response) => {
        Controller.addDetailReturnBill(request).then(result => {
            response.json(result);
        })
    })

    app.get('/order/find/:id', (request, response) => {
        Controller.findOrderWitdId(request.params.id).then(result => {
            response.json(result);
        })
    })
}