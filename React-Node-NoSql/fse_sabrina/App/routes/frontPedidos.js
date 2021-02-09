module.exports = function (app){

    app.get('/pedidos', function(req,res){
        var connection = app.app.config.database;

        var query = app.app.models.pedidoModel;
        query.getConteudo(connection, 
            function(error, results, fields){
                resultsjson = JSON.parse(JSON.stringify(results))
                console.log(error,resultsjson)
                //res.render('pages/pedidos', {dados:resultsjson});
                res.json(results);
        });
    });

}