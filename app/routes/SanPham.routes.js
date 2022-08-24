var Controller = require('../controllers/SanPham.controller');
var Model = require('./../models/SanPham.model');

module.exports = (app) => {

    app.post('/products', (request, response) => {
        Controller.getAllProduct(request).then(result => {
            response.json(result);
        })
    })

    app.post('/product/add', (request, response) => {
        Controller.addProduct(request).then(result => {
            response.json(result);
        })
    })

    app.delete('/product/delete', (request, response) => {
        Controller.deleteProduct(request).then(result => {
            response.json(result);
        })
    })

    app.get('/product/:id', (request, response) => {
        Controller.getProductWithId(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.get('/product/amount/:id', (request, response) => {
        Controller.getAmountProductWithId(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.post('/product/edit', (request, response) => {
        Controller.editProduct(request).then(result => {
            response.json(result);
        })
    })

    app.post('/product/activate', (request, response) => {
        Controller.activateProduct(request).then(result => {
            response.json(result[0]);
        })
    })
}