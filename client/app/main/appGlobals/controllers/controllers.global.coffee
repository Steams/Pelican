'use strict'

angular.module 'landerApp'
.controller 'globalCtrl',['$scope','$resource','$sce','mainFactory','$location','notesFactory','authorsFactory',
($scope,$resource,$sce,mainFactory,$location,notesFactory,authorsFactory) ->

	$scope.alert = ()-> alert('swpie')
	$scope.notebooks = ()-> mainFactory.user.Notebooks
	# $scope.loadAuthors = ()-> authorsFactory.indexAuthors()
	# $scope.authors = ()-> return authorsFactory.authors
	$scope.notes = ()-> return notesFactory.notes
	$scope.getLocation = ()->
		console.log 'globalCtrl: Getting Location...'
		return mainFactory.getLocation()

	$scope.openView = (url)->
		console.log 'globalCtrl: Opening view...'
		$location.url(['/'+url])

	$scope.setUser = (user)-> mainFactory.setUser(user)
	$scope.setHeading = (heading)-> mainFactory.setSearchHeading(heading)
	$scope.heading = ()-> return mainFactory.searchHeading
	$scope.user = ()-> return mainFactory.user
	$scope.init = ()->
		console.log 'globalCtrl: initializing'
		$scope.checkLogin()
		# $scope.loadAuthors()

	$scope.refreshPage = ()->
		console.log('globalCtrl: Refreshing Page...')
		$scope.setHeading($scope.getLocation())
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
			console.log 'NOTES NOW'
			console.log($scope.notes())
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
		# console.log(query)
		notesFactory.loadNotes(query)

	$scope.login = ()->
		console.log 'globalCtrl: Loging in....'
		login ={}
		login.username = $scope.username
		login.password = $scope.password
		mainFactory.signIn(login)

	$scope.checkLogin = ()->
		# alert 'sad'
		return mainFactory.checkLogin()

	$scope.init()
]
