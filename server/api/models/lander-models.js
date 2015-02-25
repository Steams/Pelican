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
User.hasMany(View);
User.hasMany(Notebook);
User.hasMany(Community);
// could add a through subscription to relationship
Like.belongsTo(User);
Like.belongsTo(Note);

View.belongsTo(User);
View.belongsTo(Note);

Note.belongsTo(User,{as:'Author'});
Note.belongsTo(Community);
Note.belongsTo(Notebook);
Note.hasMany(Like);
Note.hasMany(View);
Note.hasMany(Event);

Notebook.belongsTo(User,{as:'Owner'});
Notebook.hasMany(Note);

Community.belongsToMany(User,{as:'Members'});
Community.hasMany(Note);
Community.hasMany(Event);
Community.hasMany(Community,{as:'ChildCommunities'});
Community.belongsTo(Community,{as:'ParentCommunity'});

Event.belongsTo(User,{as:'Creator'});
Event.hasMany(Note);
Event.belongsTo(Community);

db.sync({force:false}).then(function(){
	// console.log('db created');
	Community.create({name:'global'});
	// User.bulkCreate([
	// 	{name:'Radcliffe',password:'passforRadcliffe'},
	// 	{name:'Kathrin',password:'passforKathrin'},
	// 	{name:'Skai',password:'passforSkai'},
	// 	{name:'Nicanor',password:'passforNicanor'},
	// ]);
	// .then(function(){
	// 	Note.bulkCreate([
	// 		{title:'Filler 1',desc:'retained on db reload',subject:'Mathematics',AuthorName:'Radcliffe',content:'<h1><b><i><u>FIller note 1</u></i></b></h1><div><b><i></i></b><p><br/></p><p>Dynamically formulate standardized process improvements rather than team driven e-services. Collaboratively re-engineer market-driven total linkage through corporate intellectual capital. Compellingly generate enabled leadership after covalent customer service. Monotonectally streamline turnkey data vis-a-vis competitive growth strategies. Holisticly evolve virtual systems before cost effective platforms.</p><p><br/></p><p>Collaboratively utilize highly efficient content via alternative growth strategies. Distinctively re-engineer high-quality interfaces vis-a-vis 2.0 materials. Phosfluorescently evolve highly efficient relationships and alternative synergy. Interactively simplify worldwide methods of empowerment without 2.0 processes. Synergistically impact 24/365 schemas without prospective resources.</p><p><br/></p><p>Credibly monetize ethical ideas rather than integrated bandwidth. Distinctively architect team building e-markets through sticky markets. Monotonectally enable B2C leadership vis-a-vis unique innovation. Distinctively drive compelling vortals whereas premier ROI. Monotonectally administrate covalent architectures without premium benefits.</p><p><br/></p><p>Quickly matrix functionalized schemas rather than synergistic niche markets. Efficiently monetize prospective e-business after world-class bandwidth. Energistically repurpose proactive total linkage before enterprise-wide convergence. Efficiently enhance leading-edge architectures rather than maintainable portals. Authoritatively initiate high-payoff infomediaries vis-a-vis multidisciplinary sources.</p><p><br/></p><p>Competently initiate B2C infomediaries via impactful action items. Quickly parallel task sustainable methods of empowerment through clicks-and-mortar opportunities. Rapidiously grow adaptive quality vectors for client-centered imperatives. Intrinsicly utilize interactive partnerships rather than covalent best practices. Holisticly streamline one-to-one benefits rather than unique alignments.</p><p><br/></p><p>Objectively restore market-driven architectures vis-a-vis market positioning niches. Efficiently generate client-centered technologies through professional mindshare. Seamlessly matrix collaborative solutions without extensive e-business. Distinctively optimize transparent action items vis-a-vis enterprise channels. Seamlessly plagiarize go forward initiatives through resource-leveling markets.</p><p><br/></p><p>Progressively drive premium paradigms through adaptive innovation. Assertively exploit market positioning intellectual capital after an expanded array of products. Professionally supply worldwide process improvements before enabled platforms. Professionally whiteboard functionalized opportunities after tactical ROI. Holisticly leverage existing resource maximizing interfaces whereas intermandated solutions.</p><p><br/></p><p>Seamlessly network cross-unit leadership skills after accurate intellectual capital. Completely target end-to-end action items through client-centered benefits. Appropriately reintermediate unique solutions without goal-oriented deliverables. Synergistically embrace impactful total linkage through resource sucking niche markets. Collaboratively seize magnetic deliverables without customer directed benefits.</p><p><br/></p><p>Efficiently evolve timely internal or &#34;organic&#34; sources vis-a-vis client-focused bandwidth. Competently coordinate user-centric convergence for corporate action items. Proactively innovate revolutionary leadership skills before highly efficient innovation. Compellingly brand turnkey total linkage before focused interfaces. Collaboratively empower just in time collaboration and idea-sharing via transparent communities.</p><p><br/></p><p>Dynamically matrix multifunctional action items without exceptional leadership skills. Globally aggregate principle-centered customer service whereas high standards in opportunities. Efficiently foster team building intellectual capital and high standards in applications. Holisticly pursue multifunctional e-services rather than distinctive testing procedures. Efficiently pontificate innovative e-markets for worldwide ROI.</p><p><br/></p><p>Professionally seize goal-oriented results after long-term high-impact interfaces. Professionally leverage existing robust strategic theme areas whereas enterprise web-readiness. Holisticly develop accurate e-markets rather than multimedia based collaboration and idea-sharing. Dramatically fashion bleeding-edge action items after prospective alignments. Synergistically impact 2.0 applications vis-a-vis real-time growth strategies.</p><p><br/></p><p>Dynamically strategize high standards in technologies whereas economically sound scenarios. Globally formulate corporate products with standards compliant vortals. Professionally build process-centric e-services after standardized channels. Monotonectally matrix resource maximizing expertise before team driven meta-services. Professionally parallel task high standards in products and efficient expertise.</p></div>'},
	// 		{title:'Filler 2',desc:'filler',subject:'English',AuthorName:'Skai',content:'<h1>Filler 2</h1>'},
	// 		{title:'Filler 3',desc:'filler',subject:'English',AuthorName:'Kathrin',content:'<h1>Filler 3</h1>'},
	// 		{title:'Filler 4',desc:'filler',subject:'Engineering',AuthorName:'Nicanor',content:'<h1>Filler 4</h1>'},
	// 		// {title:'Filler 4',desc:'filler',subject:'Mathematics',AuthorName:'Kathryn',content:'<h1>Filler 4</h1>'},
	// 		{title:'Filler 5',desc:'filler',subject:'English',AuthorName:'Radcliffe',content:'<h1>Filler 5</h1>'},
	// 		{title:'Filler 6',desc:'filler',subject:'Mathematics',AuthorName:'Skai',content:'<h1>Filler 5</h1>'}
	// 	]);
	// 	Notebook.bulkCreate([
	// // 		{name:'Filler notebook',OwnerName:'Radcliffe'}
	// // 	]);
	// // });
	// // User.create({name:'visitor',password:'no password'});
	// // // Note.bulkCreate([
	// // // 	{title:'Filler 1',desc:'retained on db reload',subject:'Mathematics',AuthorName:'Radcliffe',content:'<h1><b><i><u>FIller note 1</u></i></b></h1><div><b><i></i></b><p><br/></p><p>Dynamically formulate standardized process improvements rather than team driven e-services. Collaboratively re-engineer market-driven total linkage through corporate intellectual capital. Compellingly generate enabled leadership after covalent customer service. Monotonectally streamline turnkey data vis-a-vis competitive growth strategies. Holisticly evolve virtual systems before cost effective platforms.</p><p><br/></p><p>Collaboratively utilize highly efficient content via alternative growth strategies. Distinctively re-engineer high-quality interfaces vis-a-vis 2.0 materials. Phosfluorescently evolve highly efficient relationships and alternative synergy. Interactively simplify worldwide methods of empowerment without 2.0 processes. Synergistically impact 24/365 schemas without prospective resources.</p><p><br/></p><p>Credibly monetize ethical ideas rather than integrated bandwidth. Distinctively architect team building e-markets through sticky markets. Monotonectally enable B2C leadership vis-a-vis unique innovation. Distinctively drive compelling vortals whereas premier ROI. Monotonectally administrate covalent architectures without premium benefits.</p><p><br/></p><p>Quickly matrix functionalized schemas rather than synergistic niche markets. Efficiently monetize prospective e-business after world-class bandwidth. Energistically repurpose proactive total linkage before enterprise-wide convergence. Efficiently enhance leading-edge architectures rather than maintainable portals. Authoritatively initiate high-payoff infomediaries vis-a-vis multidisciplinary sources.</p><p><br/></p><p>Competently initiate B2C infomediaries via impactful action items. Quickly parallel task sustainable methods of empowerment through clicks-and-mortar opportunities. Rapidiously grow adaptive quality vectors for client-centered imperatives. Intrinsicly utilize interactive partnerships rather than covalent best practices. Holisticly streamline one-to-one benefits rather than unique alignments.</p><p><br/></p><p>Objectively restore market-driven architectures vis-a-vis market positioning niches. Efficiently generate client-centered technologies through professional mindshare. Seamlessly matrix collaborative solutions without extensive e-business. Distinctively optimize transparent action items vis-a-vis enterprise channels. Seamlessly plagiarize go forward initiatives through resource-leveling markets.</p><p><br/></p><p>Progressively drive premium paradigms through adaptive innovation. Assertively exploit market positioning intellectual capital after an expanded array of products. Professionally supply worldwide process improvements before enabled platforms. Professionally whiteboard functionalized opportunities after tactical ROI. Holisticly leverage existing resource maximizing interfaces whereas intermandated solutions.</p><p><br/></p><p>Seamlessly network cross-unit leadership skills after accurate intellectual capital. Completely target end-to-end action items through client-centered benefits. Appropriately reintermediate unique solutions without goal-oriented deliverables. Synergistically embrace impactful total linkage through resource sucking niche markets. Collaboratively seize magnetic deliverables without customer directed benefits.</p><p><br/></p><p>Efficiently evolve timely internal or &#34;organic&#34; sources vis-a-vis client-focused bandwidth. Competently coordinate user-centric convergence for corporate action items. Proactively innovate revolutionary leadership skills before highly efficient innovation. Compellingly brand turnkey total linkage before focused interfaces. Collaboratively empower just in time collaboration and idea-sharing via transparent communities.</p><p><br/></p><p>Dynamically matrix multifunctional action items without exceptional leadership skills. Globally aggregate principle-centered customer service whereas high standards in opportunities. Efficiently foster team building intellectual capital and high standards in applications. Holisticly pursue multifunctional e-services rather than distinctive testing procedures. Efficiently pontificate innovative e-markets for worldwide ROI.</p><p><br/></p><p>Professionally seize goal-oriented results after long-term high-impact interfaces. Professionally leverage existing robust strategic theme areas whereas enterprise web-readiness. Holisticly develop accurate e-markets rather than multimedia based collaboration and idea-sharing. Dramatically fashion bleeding-edge action items after prospective alignments. Synergistically impact 2.0 applications vis-a-vis real-time growth strategies.</p><p><br/></p><p>Dynamically strategize high standards in technologies whereas economically sound scenarios. Globally formulate corporate products with standards compliant vortals. Professionally build process-centric e-services after standardized channels. Monotonectally matrix resource maximizing expertise before team driven meta-services. Professionally parallel task high standards in products and efficient expertise.</p></div>'},
	// // // 	{title:'Filler 2',desc:'filler',subject:'English',AuthorName:'Skai',content:'<h1>Filler 2</h1>'},
	// // // 	{title:'Filler 3',desc:'filler',subject:'Engineering',AuthorName:'Nicanor',content:'<h1>Filler 3</h1>'},
	// // // 	{title:'Filler 4',desc:'filler',subject:'Mathematics',AuthorName:'Kathryn',content:'<h1>Filler 4</h1>'},
	// // // 	{title:'Filler 5',desc:'filler',subject:'English',AuthorName:'Radcliffe',content:'<h1>Filler 5</h1>'},
	// // // 	{title:'Filler 6',desc:'filler',subject:'Mathematics',AuthorName:'Skai',content:'<h1>Filler 5</h1>'}
	// // // ]);
	// Notebook.bulkCreate([
	// 	{name:'Filler notebook',OwnerName:'Radcliffe'}
	// ]);
	// Event.bulkCreate([
	// 	{name:'Japan exam',desc:'hiragana quiz on monday'}
	// ]);
});


module.exports.noteModel = Note;
module.exports.userModel = User;
module.exports.communityModel = Community;
module.exports.likeModel = Like;
module.exports.viewModel = View;
module.exports.notebookModel = Notebook;
module.exports.eventModel = Event;