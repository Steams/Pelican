var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;

exports.showSubjects = function(req,res){
	// res.send(200)
	Note.findAndCountAll({where:{subject:{nlike:''}}}).then(function(result){
		var count = result.count;
		var response = {
			subjects:[],
			count: count,
			subs:[]
		};
		var x;
		for(x = 0; x < result.rows.length;x++){
			response.subjects[x] = result.rows[x].subject;
			response.subs[x] = {name :result.rows[x].subject};
		}
		res.json(response);
		//send list of subjects that can be conuted for stats
	});
};
