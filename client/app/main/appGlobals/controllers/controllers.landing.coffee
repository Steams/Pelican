'use strict'

angular.module 'landerApp'
.controller 'landingCtrl',['$scope','$resource','$sce','notesFactory','mainFactory','$location',($scope,$resource,$sce,notesFactory,mainFactory,$location) ->

	$scope.init = ()->
		document.getElementsByTagName('body')[0].style.overflowY = 'scroll'

	$scope.signUp = ()->
		obj ={}
		obj.name = $scope.username
		obj.password = $scope.password
		obj.email = $scope.email
		mainFactory.signUp(obj)

	$scope.init()
]
