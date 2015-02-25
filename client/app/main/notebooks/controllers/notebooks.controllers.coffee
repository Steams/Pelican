'use strict'

angular.module 'landerApp'
.controller 'notebooksCtrl',['$scope','$location','$sce','notebooksFactory','mainFactory',
($scope,$location,$sce,notebooksFactory,mainFactory) ->

	$scope.notebooks = ()-> return mainFactory.notebooks #keep notebooks up to date by always checking factory when referecing it
	$scope.selected = ()-> return notebooksFactory.selected
	$scope.selectNotebook = (index)-> return notebooksFactory.selectNotebook(index)
	# $scope.init = ()->
	# notebooksFactory.indexNotebooks()

	$scope.openNotebook = (name)->
		console.log('LOGING NOTES')
		console.log($.grep($scope.notebooks(),(e)-> return e.name == name)[0].Notes)
		mainFactory.notes = $.grep($scope.notebooks(),(e)-> return e.name == name)[0].Notes
		console.log mainFactory.notes
		$location.url('/notes?notebook='+name)
  # $scope.init()
]