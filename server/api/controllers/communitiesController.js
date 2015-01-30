var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;
var View = Models.viewModel;
var Community = Models.communityModel;
var Event = Models.eventModel;

exports.createCommunity = function(req,res){
	console.log('creating community');
	console.log(req.body);
	Community.create({
		name:req.body.name,
		// parentCommunity:req.body.parentCommunnity,
		// parent community should search for the query term then use setParent
	}).then(function(community){
		if(req.body.parentCommunity){
			Community.find({where:{name:req.body.parentCommunity} }).then(function(parent){
				community.setParentCommunity(parent).then(function(){
					parent.addChildCommunity(community).then(function(){
						res.json(community);
					});
				});
			});
		}else{
			console.log('no parent');
			res.json(community);
		}
	});
};

exports.indexCommunities = function(req,res){
	console.log('indexing communities');
	Community.findAll({include:[
			{model:User,as:'Members'},
			Note,
			{model:Community,as:'ParentCommunity'},
			{model:Community,as:'ChildCommunities'},
			Event
		]}).then(function(communities){
		res.json(communities);
	});
};

exports.destroy = function(req,res){
	Community.destroy({truncate:true}).then(function(){
		res.send(200);
	});
};