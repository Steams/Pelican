var Models = require('../models/lander-models');
var Note = Models.noteModel;
var User = Models.userModel;
var Like = Models.likeModel;

exports.showSubjects = function(req,res){
	Note.findAndCountAll({where:{subject:{nlike:''}}}).then(function(result){
		var count = result.count;
		var response = {
			subjects:[],
			count: count,
		};
		var x;
		for(x = 0; x < result.rows.length;x++){
			response.subjects[x] = result.rows[x].subject;
		}
		res.json(response);
		//send list of subjects that can be conuted for stats
	});
};
