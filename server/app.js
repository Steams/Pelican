/**
 * Main application file
 */

'use strict';

// Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var express = require('express');
var mongoose = require('mongoose');
var config = require('./config/environment');
var bodyParser = require('body-parser');
// var Sequelize = require('sequelize');

// Connect to database
// mongoose.connect(config.mongo.uri, config.mongo.options);

// var db = new Sequelize('db', 'steams', 'tothestars', {
//   host: 'localhost',
//   dialect: 'sqlite',
//   port :9999,
//   storage: 'lander-db.sqlite'
// });

// var User = db.define('User',{
// 	name :{
// 		type:Sequelize.STRING
// 	},
// 	password :Sequelize.STRING
// });

// var Note = db.define('Note',{
//   id:Sequelize.UUID,
//   title:Sequelize.STRING,
//   desc: Sequelize.STRING,
//   author:Sequelize.STRING,
//   subject:Sequelize.STRING,
//   content:Sequelize.STRING
//   // date
//   //each column as json obj, add validation element
// });

// var userVar;

// User.sync({force:true}).then(function(){
// 	User.create({
// 		name:'Radcliffe',
// 	});

// 	User.find({where:{name:'Radcliffe'}}).then(function(user){
// 		userVar = user.name;
// 		console.log('username' + userVar);
// 	});

// 	//force drops the table and recreates it
// 	Note.sync({force: true}).then(function ()
// 	{
// 		// Table created
// 		Note.create({
// 			title: 'Rads note',
// 			author:'Radcliffe',
// 		});
// 		// console.log('found note ');

// 		Note.find({where:{author:userVar} }).then(function(note){
// 			console.log('note found');
// 			console.log(note.title);
// 			// console.log(userVar);
// 		});
// 	});
// });

// var firstNote =Note.build({title:'first title'});
// var Note.save();
// console.log('Note find');
// var resNote = MyNote.find({title:'First note'});
// console.log(resNote.synch().success(function(note){return note.title}));
//var notes = mongoose
// use var= mongoose.createConnection and create 1 for users and one for notes
// Populate DB with sample data
if(config.seedDB) { require('./config/seed'); }

// Setup server

var app;
app = express();
var server = require('http').createServer(app);
require('./config/express')(app);

// app.use("/bower_components", express.static(app.get('appPath')+'/bower_components'));

require('./routes')(app);

// Start server
server.listen(config.port, config.ip, function () {
  console.log('Express server listening on %d, in %s mode', config.port, app.get('env'));
});

// Expose app
module.exports = app;
