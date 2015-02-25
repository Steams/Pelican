var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;
var View = Models.viewModel;
var Notebook = Models.notebookModel;
var Community = Models.communityModel;

exports.createUser = function(req,res){
	console.log('creating User');
	console.log(req.body);
	//might want to use findOrCreate method
	User.create({
		name:req.body.name,
		password:req.body.password,
		// Communities:[]
	}).then(function(user){
		user.addCommunity('global').then(function(thing){
			Community.find({where:{name:'global'}}).then(function(com){
				com.addMember(user);
				res.json(user);
			});
		});
		// res.json(user);
	});
};

exports.indexUsers = function(req,res){
	User.findAll({include:[Like,View,{model:Notebook,include:[Note]},Community,{model:Note,include:[Like,View]}]}).then(function(users){
		res.json(users);
	});
};
