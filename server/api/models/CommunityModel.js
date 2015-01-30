var Sequelize = require('sequelize');
var db = require('./landerDB.js');

var Community = db.define('Community',{
	name:{type:Sequelize.STRING,unique:true,primaryKey:true}
});

module.exports = Community;