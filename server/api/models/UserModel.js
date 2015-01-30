var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var User = db.define('User',{
	id:{
		type:Sequelize.UUID,
		defaultValue:Sequelize.UUIDV4,
		// primaryKey:true
	},
	name :{
		type:Sequelize.STRING,
		allowNull:false,
		unique:true,
		primaryKey:true
	},
	password :{
		type:Sequelize.STRING,
		allowNull:false
	},
	email:{
		type:Sequelize.STRING || 'no email',
		allowNull:true
	},
	rank:{
		type:Sequelize.INTEGER,
		defaultValue:1
	},
	reputation:{
		type:Sequelize.FLOAT(11),
		defaultValue:0
	}

},{
	getterMethods:{
		age:function(){
			joined = this.getDataValue('joined');
			return (Sequelize.NOW - joined);//check if this works 
		}
	}
});

module.exports = User;