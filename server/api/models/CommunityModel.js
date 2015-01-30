var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var Community = db.define('Communnity',{
	name:Sequelize.STRING
});

module.exports = Community;