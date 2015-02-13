'use strict'

angular.module 'landerApp'
.controller 'viewCtrl',['$scope','$resource','$sce','notesFactory','$location','mainFactory',($scope,$resource,$sce,notesFactory,$location,mainFactory) ->

	viewPanel = document.getElementById('viewPanel')
	$scope.name = ()-> return mainFactory.user.name
	$scope.notes = ()-> return notesFactory.notes #keep notes up to date by always checking factory when referecing it
	$scope.selected = ()-> return notesFactory.selected
	$scope.selectNote = (index)-> return notesFactory.selectNote(index)
	$scope.loadNotes = (query)-> return notesFactory.loadNotes(query)
	$scope.init = ()->
		console.log('Logging Params')
		mainFactory.setSearchHeading(mainFactory.getLocation())
		# console.log($location.search())
		searchObj = $location.search()
		query = '?'
		url = $location.url().split('/')
		# console.log(url)
		if(url.length >2 )
			if(url[1]=='authors')
				query +='author='+url[2].split('?')[0]+'&'#strip out any queryies after the route name
			if(url[1]=='subjects')
				query +='subject='+url[2].split('?')[0]+'&'
		if(searchObj.author)
			query +='author='+searchObj.author+'&'
		if(searchObj.subject)
			query+='subject='+searchObj.subject+'&'
		if(searchObj.title)
			query +='title='+searchObj.title+'&'
		if(searchObj.community)
			query +='community='+searchObj.community+'&'
		if(searchObj.tags)
			query +='tags='+searchObj.tags+'&'
		console.log(query)
		notesFactory.loadNotes(query)

	$scope.openNote =(id)->
		$scope.selectNote(id)
		console.log('id : '+id)
		# console.log('selected now : '+$scope.selected() )
		# console.log(notesFactory.selected)
		viewPanel.innerHTML = $scope.selected().content
		view = {}
		view.noteId = $scope.selected().id
		view.userName = $scope.name
		notesFactory.view(view);

	$scope.openTag = (tag)->
		$location.search('tags',tag)
		$scope.init()
		# $location.reload()
	$scope.likeNote = ()->
		console.log 'viewCtrl: Liking note...'
		# console.log('selected :'+ $scope.selected())
		like = {}
		like.noteId = $scope.selected().id
		like.userName = $scope.name();
		console.log $scope.name()
		if notesFactory.like(like) != 500
			$scope.selected().likeCount++
		# console.log('Liked note title : '+$scope.notes()[index].title+'Liked note User :'+like.userName)

	$scope.loadList = (subject)->
		notesFactory.loadList(subject)

	$scope.init()
]