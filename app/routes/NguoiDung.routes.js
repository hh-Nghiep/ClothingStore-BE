var Controller = require('../controllers/NguoiDung.controller');
var Model = require('./../models/NguoiDung.model');

module.exports = (app) => {
    app.post('/users', (request, response) => {
        Controller.getUserByRole(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/id', (request, response) => {
        Controller.getUserById(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/edit', (request, response) => {
        Controller.updateUser(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/updatePassword', (request, response) => {
        Controller.updatePassword(request).then(result => {
            response.json(result);
        })
    })

    app.delete('/user/disable', (request, response) => {
        Controller.disableUser(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/add', (request, response) => {
        Controller.addUser(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/login', (request, response) => {
        Controller.login(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/checkPhone', (request, response) => {
        Controller.checkPhone(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/checkEmail', (request, response) => {
        Controller.checkEmail(request).then(result => {
            response.json(result);
        })
    })

    app.post('/user/checkId', (request, response) => {
        Controller.checkId(request).then(result => {
            response.json(result);
        })
    })
}