var fs = require("fs");
var file = "lander.db";
var exists = fs.existsSync(file);
var bodyParser = require('body-parser');


if(!exists) {
  console.log("Creating DB file.");
  fs.openSync(file, "w");
}
var sqlite3 = require("sqlite3").verbose();
var db = new sqlite3.Database(file);

db.serialize(function() {
  if(!exists) {
    db.run("CREATE TABLE Notes ('title' TEXT, 'desc' TEXT, 'author' TEXT, 'subject' TEXT, 'content' TEXT)");
  }
});

var NoteSql = function(note){

  var self;
  if(note){
    m_note = note;
    console.log('note ');
    console.log(note);
    self = this;
    self.title = m_note.title;
    self.author= m_note.author;
    self.desc = m_note.desc;
    self.subject=m_note.subject;
    self.content = m_note.content;

    self.save = function(callback){
      var stmt = db.prepare("INSERT INTO Notes VALUES (?,?,?,?,?)");
      stmt.run(self.title,self.desc,self.author,self.subject,self.content);
      stmt.finalize();
      //response should be error or query of note
      response = m_note;
      callback(m_note);
    }
  }


  return self;
};

module.exports.create = function(req,res){
  var note;
  console.log('req body');
  console.log(req.body);
  note = new NoteSql(req.body);

  console.log('note ' + note);
  return note.save(function(response){
    return res.json(response);
  });
};

module.exports.index= function(req,res){
  console.log(req.params);
};
