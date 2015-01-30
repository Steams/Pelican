var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var Event = db.define('Event',{
	time:{
		type:Sequelize.DATE
	},
	name:{
		type:Sequelize.STRING
	},
	desc:{
		type:Sequelize.STRING
	}
});

module.exports = Event;