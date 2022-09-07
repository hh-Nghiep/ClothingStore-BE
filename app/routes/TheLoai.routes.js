var Controller = require('../controllers/TheLoai.controller');
var Model = require('./../models/TheLoai.model');

module.exports = (app) => {
    app.get('/cate/:id', (request, response) => {
        Controller.GetAllCategoryWithStatus(request.params.id).then(result => {
            response.json(result);
        })
    })

    app.post('/cate/add', (request, response) => {
        Controller.AddCategory(request).then(result => {
            response.json(result);
        })
    })

    app.delete('/cate/status', (request, response) => {
        Controller.UpdateStatusCategory(request).then(result => {
            response.json(result);
        })
    })

    app.post('/cate/update', (request, response) => {
        Controller.UpdateCateGory(request).then(result => {
            response.json(result);
        })
    })
}