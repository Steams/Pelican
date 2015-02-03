var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var Notebook = db.define('Notebook',{
	name:Sequelize.STRING,
	id:{
		type:Sequelize.UUID,
		defaultValue:Sequelize.UUIDV4,
		primaryKey:true
	}
});

module.exports = Notebook;