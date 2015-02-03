var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;
var View = Models.viewModel;
var Community = Models.communityModel;
var Notebook = Models.notebookModel;

exports.createNotebook = function(req,res){
	console.log(req.body);
	var notebook = Notebook.build({
		name:req.body.name,
	});
	notebook.save().then(function(notebook){
		User.find({where:{name:req.body.author} }).then(function(author){
			notebook.setOwner(author).then(function(){
				author.addNotebooks([notebook]).then(function(){
						res.json(notebook)
				});
			});
		});
	});
};

exports.indexNotebooks = function(req,res){
	Notebook.findAll({include:[{model:User,as:'Owner'},Note]}).then(function(notebooks){
		res.json(notebooks);
	});
};

exports.addNote = function(req,res){
	console.log(req.body);
	Notebook.find({where:{name:req.body.notebookName}}).then(function(notebook){
		Note.find({where:{id:req.body.noteId}}).then(function(note){
			notebook.addNotes([note]).then(function(notebook){
				res.json(notebook);
			});
		});
	});
}