var Sequelize = require('sequelize');
var Note = require('./NoteModel.js');
var User = require('./UserModel.js');
var Like = require('./LikeModel.js');
var Event = require('./EventModel.js');
var Community = require('./CommunityModel.js');
var Notebook = require('./NotebookModel.js');
var View = require('./ViewModel.js');
var db = require('./landerDB.js');



User.hasMany(Note);
User.hasMany(Event);
User.hasMany(Like);
User.hasMany(Notebook);
User.belongsToMany(Community);

Like.belongsTo(User);
Like.belongsTo(Note);

View.belongsTo(User);
View.belongsTo(Note);

Note.belongsTo(User,{as:'Author'});
Note.belongsTo(Community);
Note.hasMany(Like);
Note.hasMany(View);

Notebook.belongsTo(User,{as:'Author'});
Notebook.hasMany(Note);

Community.hasMany(User,{as:'Members'});
Community.hasMany(Note);
Community.hasMany(Event);
Community.hasMany(Community,{as:'ChildCommunities'});
Community.belongsTo(Community,{as:'ParentCommunity'});

Event.belongsTo(User,{as:'Creator'});
Event.hasMany(Note);
Event.belongsTo(Community);

db.sync({force:false}).then(function(){
	console.log('db created');
	// Community.create({name:'global'});
	// User.bulkCreate([
	// 	{name:'Radcliffe',password:'passforRadcliffe'},
	// 	{name:'Kathrin',password:'passforKathrin'},
	// 	{name:'Skai',password:'passforSkai'},
	// 	{name:'Nicanor',password:'passforNicanor'},
	// ]);
	// User.create({name:'visitor',password:'no password'});
});


module.exports.noteModel = Note;
module.exports.userModel = User;
module.exports.communityModel = Community;
module.exports.likeModel = Like;
module.exports.viewModel = View;
module.exports.notebookModel = Notebook;
module.exports.eventModel = Event;