var Note;

Note = require('../models/note-model.js');

module.exports.create = function(req, res) {
  var note;
  note = new Note(req.body);
  console.log(req.body);
  console.log('note ' + note);
  return note.save(function(err, result) {
    return res.json(result);
  });
};

module.exports.index = function(req, res) {
  return Note.find({}, function(err, notesList) {
    return res.json(notesList);
  });
};

module.exports.show = function(req, res) {
  console.log(req.params.query);
  // var str = req.params.query.toString().slice(0, - 1);
  // var x = JSON.parse(str);
  return Note.find({subject:req.params.query}, function(err, notesList) {
    return res.json(notesList);
  });
};
