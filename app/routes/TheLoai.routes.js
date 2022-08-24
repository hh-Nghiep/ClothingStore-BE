var Controller = require('../controllers/TheLoai.controller');
var Model = require('./../models/TheLoai.model');

module.exports = (app) => {
    app.get('/cates', (request, response) => {
        Controller.GetAllCateGory().then(result => {
            response.json(result);
        })
    })

    app.post('/cate/add', (request, response) => {
        Controller.AddCategory(request).then(result => {
            response.json(result);
        })
    })

    app.delete('/cate/delete', (request, response) => {
        Controller.DeleteCategory(request).then(result => {
            response.json(result);
        })
    })

    app.post('/cate/update', (request, response) => {
        Controller.UpdateCateGory(request).then(result => {
            response.json(result);
        })
    })
}