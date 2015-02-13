var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var Note = db.define('Note',{
	id:{
		type:Sequelize.UUID,
		defaultValue:Sequelize.UUIDV4,
		primaryKey:true
	},
	title:{
		type:Sequelize.STRING,
		unique:true,
		// primaryKey:true
	},
	desc: Sequelize.STRING,
  	isPrivate:{
		type:Sequelize.BOOLEAN,
		defaultValue:false
	},
	tags:{type:Sequelize.STRING},
	subject:Sequelize.STRING,
	content:Sequelize.STRING,
});

module.exports = Note;