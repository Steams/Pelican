var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;
var View = Models.viewModel;
var Community = Models.communityModel;
var Event = Models.eventModel;
exports.createNote = function(req,res){
	console.log(req.body);
	var note = Note.build({
		title:req.body.title,
		// author:req.body.author,
		desc:req.body.desc || 'no description',
		content:req.body.content || 'no content',
		subject:req.body.subject || 'no subject',
		tags:req.body.tags || '',
		isPrivate: req.body.isPrivate || false,
	});
	note.save().then(function(note){
		User.find({where:{name:req.body.author} }).then(function(author){
			note.setAuthor(author).then(function(){
				author.addNotes([note]).then(function(){
					if(!req.body.community)
					{
						Community.find({where:{name:'global'} }).then(function(community){
							note.setCommunity(community).then(function(){
								res.json(note)
							});
						});
					}
					else{
						Community.find({where:{name:req.body.community} }).then(function(community){
							note.setCommunity(community).then(function(){
								res.json(note)
							});
						});
					}
				});
			});
		});
	});
};

exports.showNotesByQuery = function(req,res){

	query = {};
	if (req.param('author')){
		query.authorName = req.param('author');
	}
	if (req.param('title')){
		query.title = req.param('title');
	}
	if (req.param('community')){
		query.CommunityName = req.param('community');
	}
	if(req.param('subject')){
		query.subject = req.param('subject');
	}
	if(req.param('tags')){
		// console.log(req.param('tags'))
		query.tags = {like:'%'+req.param('tags')+'%'};
	}

	Note.findAll({where:query,include: [Like,View]}).then(function(notes){
		res.json(notes);
	});
};

exports.showNotesByAuthor = function(req,res){
	// console.log(req.params);
	Note.findAll({where:{AuthorName:req.params.author} },{include: [Like,{model:User,as:'Author'}]})
	.then(function(notes){
		// console.log('note found');
		// console.log(note.title);
		res.json(notes);
		// console.log(userVar);
	});
};

exports.showNotesBySubject = function(req,res){
	console.log('Showing notes by subject');
	Note.findAll({where:{subject:req.params.subject},include: [Like,{model:User,as:'Author'}]})
	.then(function(notes){
		res.json(notes);
	});
};

exports.showNotesByCommunity = function(req,res){
	console.log('showing notes by community');
	Note.findAll({where:{community:req.params.community}},{include: [Like,{model:User,as:'Author'}]})
	.then(function(results){
		res.json(results);
	});
};

// var getNoteLikes = function(note,callback){
// 	console.log('getting note likes');
// 	note.getLikes().then(function(likes){
// 		callback(likes);
// 		// return likes;
// 	});
// };

// exports.indexNotes = function(req,res){
// 	Note.findAll({include: [Like,{model:User,as:'Author'},View]}).then(function(notes){
// 		res.json(notes);
// 	});
// };

exports.destroy = function(req,res){
	Note.destroy({truncate:true}).then(function(){
		res.send(200);
	})
}

exports.deleteNote = function(req,res){
	Note.find({where:{id:req.body.noteId} }).then(function(note){
		note.destroy().then(function(){
			res.send(200,'Note Deleted')
		});
	});
}

exports.indexLikes = function(req,res){
	Like.findAll().then(function(likes){
		res.json(likes);
	});
};

exports.deleteLikes = function(req,res){
	Like.destroy({truncate:true}).then(function(){
		res.send(200);
	});
};

exports.likeNote = function(req,res){
	console.log('adding view to note');
	User.find({where:{name:req.body.userName} }).then(function(user){
		console.log(user);
		Note.find({where:{id:req.body.noteId} }).then(function(note){
			var like = Like.build({UserName:user.name,NoteId:note.id});
			// view.save().then(function(){
				Like.findAll({where:{UserName:user.name,NoteId:note.id}}).then(function(likes){
					if (likes.length > 0){
						res.send(500,'user already liked this');
					}
					else{
						console.log('we good first');
						like.save().then(function(){
							console.log('we good');
							res.send(200);
						});
					}
				});
			// });
		});
	});
};

exports.indexViews = function(req,res){
	View.findAll().then(function(views){
		res.json(views);
	});
};

exports.deleteViews = function(req,res){
	View.destroy({truncate:true}).then(function(){
		res.send(200);
	});
};

exports.viewNote = function(req,res){
	console.log('adding view to note');
	console.log(req.body.userName);
	User.find({where:{name:req.body.userName} }).then(function(user){
		Note.find({where:{id:req.body.noteId} }).then(function(note){
			var view = View.build({UserName:user.name,NoteId:note.id});
			// view.save().then(function(){
				View.findAll({where:{UserName:user.name,NoteId:note.id}}).then(function(views){
					if (views.length > 0){
						res.send(500,'user already viewed this');
					}
					else{
						console.log('we good first');
						view.save().then(function(){
							console.log('we good');
							res.json(view);
						});
					}
				});
			// });
		});
	});
};
// exports.getNoteLikes = getNoteLikes;
