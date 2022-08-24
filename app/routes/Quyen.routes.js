var Controller = require('../controllers/Quyen.controller');
var quyenlRole = require('./../models/Quyen.model');

module.exports = function (app) {
    app.get('/roles', (request, response) => {
        Controller.getAllRole().then(result => {
            response.json(result);
        })
    })

    app.get('/roles/test', (request, response) => {
        let values = { ...request.body }
        let maDH = 0;

        Controller.getIdRoleWithName(values).then(result => {
            response.json(Object.entries(result[0][0])[0][1]);
            maDH = Object.entries(result[0][0])[0][1];
        })
    })

    app.get('/roles/test2', (request, response) => {
        let values = { ...request.body }

        Controller.TEST(values).then(result => {
            console.log(result)
            response.json(result);
        })
    })
}

