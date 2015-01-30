var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;


exports.createUser = function(req,res){
	console.log('creating User');
	console.log(req.body);
	//might want to use findOrCreate method
	User.create({
		name:req.body.name,
		password:req.body.password,
	}).then(function(user){
		res.json(user);
	});
};

exports.indexUsers = function(req,res){
	User.findAll({include:[{model:Note,include:[Like]}]}).then(function(users){
		res.json(users);
	});
};
