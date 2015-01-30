var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Community = Models.communityModel;
var Like = Models.likeModel;
var bodyParser = require('body-parser');


// exports.createUser = function(req,res){
// 	console.log('creating User');
// 	console.log(req.body);
// 	//might want to use findOrCreate method
// 	User.create({
// 		name:req.body.name,
// 		password:req.body.password,
// 	}).then(function(user){
// 		res.json(user);
// 	});
// };

// exports.indexUsers = function(req,res){
// 	User.findAll({include:[{model:Note,include:[Like]}]}).then(function(users){
// 		res.json(users);
// 	});
// 	// 	var UserArray = [];
// 	// 	var x =0;
// 	// 	var addUserInfo = function(usernow){
// 	// 		console.log('adding user to output list');
// 	// 		var y = x;
// 	// 		//set y because the loop gets itterated faster than the then function is called since promise delay
// 	// 		usernow.getNotes().then(function(notes){
// 	// 			//todo : after getting notes, set each in an object with the note and its likes
// 	// 			UserArray[y] = {
// 	// 				author:usernow,
// 	// 				notes:notes,
// 	// 				// userNumber:y,
// 	// 				// length:users.length
// 	// 				};
// 	// 				//check if this was the last itteration of the loop then return json
// 	// 			if(y == (users.length-1)){
// 	// 				res.json(UserArray);
// 	// 			}
// 	// 			});
// 	// 	}
// 	// 	for( x ; x < users.length ; x++){
// 	// 		addUserInfo(users[x]);
// 	// 		console.log(x);
// 	// 	}
// 	// });
// };

// exports.showSubjects = function(req,res){
// 	Note.findAndCountAll({where:{subject:{nlike:''}}}).then(function(result){
// 		var count = result.count;
// 		var response = {
// 			subjects:[],
// 			count: count,
// 		};
// 		var x;
// 		for(x = 0; x < result.rows.length;x++){
// 			response.subjects[x] = result.rows[x].subject;
// 		}
// 		res.json(response);
// 		//send list of subjects that can be conuted for stats
// 	});
// };

exports.createCommunity = function(req,res){
	console.log('creating community');
	console.log(req.body);
	Community.create({
		name:req.body.name,
		parentCommunity:req.body.parentCommunnity,
	}).then(function(community){
		res.json(community);
	});
};

exports.indexCommunities = function(req,res){
	console.log('indexing communities');
	Community.findAll().then(function(communities){
		res.json(communities);
	});
};

// exports.createLike = function(req,res){
// 	console.log('creating like');
// 	var like = Like.build({});
// 	like.save().then(function(like){
// 		User.find({where:{name:req.body.userName} }).then(function(user){
// 			Note.find({where:{id:req.body.noteId} }).then(function(note){
// 				like.setUser(user);
// 				like.setNote(note);
// 				res.json(like);
// 			});
// 		});
// 		// like.setUser()
// 	});
// };