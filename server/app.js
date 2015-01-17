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

// Connect to database
mongoose.connect(config.mongo.uri, config.mongo.options);
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
