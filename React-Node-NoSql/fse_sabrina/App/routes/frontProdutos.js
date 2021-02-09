module.exports = function (app){

    app.get('/produtos', function(req,res){
        var connection = app.app.config.database;

        var query = app.app.models.produtoModel;
        query.getConteudo(connection, 
            function(error, results, fields){
                resultsjson = JSON.parse(JSON.stringify(results))
                console.log(error,resultsjson)
                //res.render('pages/produtos', {dados:resultsjson});
                res.json(results);
        });
    });

}