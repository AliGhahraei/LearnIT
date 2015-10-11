var mongoose = require('mongoose');

var EsquemaUsuario = new mongoose.Schema({
    usuario: String,
    contrasenia: String
});

mongoose.model('Usuario', EsquemaUsuario);
