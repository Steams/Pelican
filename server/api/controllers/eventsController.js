var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;
var View = Models.viewModel;
var Community = Models.communityModel;
var Event = Models.eventModel;

exports.createEvent = function(req,res){
	console.log('creating event');
	console.log(req.body);
	Event.create({
		name:req.body.name,
		time:req.body.time,
		desc:req.body.desc
	}).then(function(event){
		if(req.body.creator){
			User.find({where:{name:req.body.creator} }).then(function(creator){
				event.setCreator(creator).then(function(){
					if(req.body.community){
						Community.find({where:{name:req.body.community} }).then(function(community){
							event.setCommunity(community).then(function(){
								community.addEvent(event).then(function(){
									res.json(event);
								});
							});
						});
					}else{
						res.json(event);
					}
				});
			});
		}
		else{
			if(req.body.community){
				Community.find({where:{name:req.body.community} }).then(function(community){
					event.setCommunity(community).then(function(){
						community.addEvent(event).then(function(){
							res.json(event);
						});
					});
				});
			}else{
				res.json(event);
			}
		}
	});
};

exports.indexEvents = function(req,res){
	console.log('indexing communities');
	Event.findAll({include:[{model:User,as:'Creator'}]}).then(function(events){
		res.json(events);
	});
};

exports.destroy = function(req,res){
	Event.destroy({truncate:true}).then(function(){
		res.send(200);
	});
};