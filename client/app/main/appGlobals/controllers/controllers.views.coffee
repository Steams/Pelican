'use strict'

angular.module 'landerApp'
.controller 'viewCtrl',['$scope','$resource','$sce','notesFactory','$location','mainFactory',($scope,$resource,$sce,notesFactory,$location,mainFactory) ->

	$scope.myMoment =  moment
	viewPanel = document.getElementById('viewPanel')
	viewInner = document.getElementById('viewInner')
	$scope.notebooks = ()-> return mainFactory.notebooks
	$scope.ready = ()-> return notesFactory.ready
	$scope.authorReady = ()-> return mainFactory.ready
	$scope.name = ()-> return mainFactory.user.name
	$scope.notes = ()-> return notesFactory.notes #keep notes up to date by always checking factory when referecing it
	$scope.selected = ()-> return notesFactory.selected
	$scope.selectNote = (index)-> return notesFactory.selectNote(index)
	$scope.loadNotes = (query)-> return notesFactory.loadNotes(query)
	$scope.init = ()->
		console.log('Logging Params')
		document.getElementsByTagName('body')[0].style.overflow = 'hidden'
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
		if(searchObj.notebook)
			timer = 0
			backOff = ()->
				# console.log('backof')
				if $scope.authorReady()
					notesFactory.notes = $.grep($scope.notebooks(),(e)-> return e.name == decodeURIComponent(searchObj.notebook))[0].Notes
				else
					timer += 200
					console.log(timer)
					clearTimeout()
					setTimeout(backOff,timer)
			backOff()
			return
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
		if(searchObj.notebook)
			query +='notebook='+searchObj.notebook+'&'
		console.log(query)
		notesFactory.loadNotes(query)
		if(searchObj.o)
			timer = 0
			backOff = ()->
				# console.log('backof')
				if $scope.ready()
					# alert('ready')
					notesFactory.selectNoteByTitle(searchObj.o)
					$scope.openNote($scope.selected().id)
				else
					timer += 200
					clearTimeout()
					setTimeout(backOff,timer)
			backOff()


	$scope.openNote =(id)->
		$scope.selectNote(id)
		$location.search('o',$scope.selected().title)
		$('.content-panel').attr('show','true')
		console.log('id : '+id)
		# console.log('selected now : '+$scope.selected() )
		# console.log(notesFactory.selected)
		viewInner.innerHTML = $scope.selected().content
		view = {}
		view.noteId = $scope.selected().id
		view.userName = $scope.name()
		notesFactory.view(view);

	$scope.openTag = (tag)->
		$location.search('tags',tag)
		$scope.init()
		# $location.reload()
	$scope.openAuthor = (author)->
		$location.search('author',author)
		$scope.init()

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

	$scope.addToNotebook = (id,notebook)->
		console.log(notebook)
		mainFactory.addToNotebook(id,notebook)

	$scope.loadList = (subject)->
		notesFactory.loadList(subject)

	$scope.init()
]