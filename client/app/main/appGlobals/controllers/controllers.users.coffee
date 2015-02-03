angular.module 'landerApp'
.controller 'usersCtrl',['$scope','$resource','$sce','notesFactory',($scope,$resource,$sce,notesFactory) ->

	CheckLogin = $resource('/loginInfo')

	$scope.login = ->
		login = new Login()
		login.username = $scope.username
		login.password = $scope.password
		console.log(login)

		login.$save (result)->
		console.log result
		if result.user.name
			$scope.$parent.name = result.user.name
		else
			alert('user does not exist')


	$scope.checkLogin = ->
		CheckLogin.get({},(data)->
		console.log 'getting login'
		console.log data
		$scope.name = data.user.name)

	$scope.checkLogin()
]