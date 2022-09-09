var Controller = require('../controllers/NguoiDung.controller');
var Model = require('./../models/NguoiDung.model');

module.exports = (app) => {
    app.post('/users', (request, response) => {
        var amount = 12;
        var page = parseInt(request.query.page);
        Controller.getUserByRole(request).then(result => {
            var data = {
                data: result[0].slice(((page - 1) * amount), (page * amount)),
                totalPage: Math.ceil(result[0].length / 12)
            }
            response.json(data);
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

    app.post('/user/updateinfo', (request, response) => {
        Controller.userUpdateInfo(request).then(result => {
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

    app.get('/user/find/:id', (request, response) => {
        Controller.findUserWitdEmail(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.post('/user/checkInfo', (request, response) => {
        Controller.checkInfoUser(request).then(result => {
            response.json(result);
        })
    })
}