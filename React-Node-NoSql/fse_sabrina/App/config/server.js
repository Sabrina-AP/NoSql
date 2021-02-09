var express = require('express');
var consign = require('consign');
var bodyParser = require('body-parser');
//var path = require('path');

var cors = require('cors');




var app = express();
app.use(express.static('./public'));


app.set('view engine', 'ejs');
app.set('views','././app/views');


app.use(bodyParser.urlencoded({extended:true}));
app.use(cors());
app.use(bodyParser.json());



consign()
.include('././app/routes')
.then('././app/config/database.js')
.then('././app/models')
.into(app);


module.exports = app;