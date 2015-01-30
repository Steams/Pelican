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
  	subject:Sequelize.STRING,
  	content:Sequelize.STRING,
  	// community:Sequelize.STRING,
  	views:{
  		type:Sequelize.INTEGER,
  		defaultValue:0
  	}
  		//change force to true after u add a new column
  	//each column as json obj, add validation element
});

module.exports = Note;