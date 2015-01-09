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
  console.log(req.params);
  return Note.find({}, function(err, notesList) {
    return res.json(notesList);
  });
};

module.exports.show = function(req, res) {
  console.log('show');
  console.log(req.params.id);
  // var str = req.params.query.toString().slice(0, - 1);
  // var x = JSON.parse(str);
  return Note.find({_id:req.params.id}, function(err, notesList) {
    console.log(notesList[0]);
    return res.json(notesList[0]);
  });
};
