var mongoose, noteSchema;

mongoose = require('mongoose');

noteSchema = new mongoose.Schema({
  title:String,
  desc: String,
  author: String,
  subject: String
});

module.exports = mongoose.model('Note', noteSchema);
 
