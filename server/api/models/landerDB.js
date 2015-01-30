var Sequelize = require('sequelize');

var db = new Sequelize('db', 'steams', 'tothestars', {
  host: 'localhost',
  dialect: 'sqlite',
  port :9999,
  storage: 'lander-db.sqlite'
});

module.exports = db;