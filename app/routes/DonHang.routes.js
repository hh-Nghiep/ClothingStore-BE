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
        Controller.getAllOrderWithStatus(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.post('/order/addDetail', (request, response) => {
        Controller.addDetailOrder(request).then(result => {
            response.json(result);
        })
    })

    app.post('/order/id', (request, response) => {
        Controller.getAllOrderWithId(request).then(result => {
            response.json(result);
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

    app.get('/order/detail/:id', (request, response) => {
        Controller.getDetailOrder(request.params.id).then(result => {
            response.json(result);
        })
    })
}