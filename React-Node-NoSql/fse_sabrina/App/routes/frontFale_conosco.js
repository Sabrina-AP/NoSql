module.exports = function (app){
    app.get('/return', function(req, res) {
        var db = require("../config/db")
        var query = db.Mongoose.model('comentario', db.UserSchema, 'comentario');
        query.find({}).lean().exec(
            function (error, results) {
                console.log(error,results)
                res.json(results)
                //res.render('pages/bFale_conosco', { dados: results });
        });
    });
}