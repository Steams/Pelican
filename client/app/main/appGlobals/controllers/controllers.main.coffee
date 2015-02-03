'use strict'

angular.module 'landerApp'
.controller 'globalCtrl',['$scope','$resource','$sce','mainFactory',($scope,$resource,$sce,mainFactory) ->

  $scope.setUser = (user)-> mainFactory.setUser(user)
  $scope.setHeading = (heading)-> mainFactory.setSearchHeading(heading)
  $scope.heading = ()-> return mainFactory.searchHeading
  $scope.user = ()-> return mainFactory.user
  $scope.init = ()->
    $scope.checkLogin()

  $scope.holder = {}

  Notes = $resource('/api/things/notes/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  menu = document.querySelector '#menu'

  $scope.login = ->
    login = new Login()
    login.username = $scope.username
    login.password = $scope.password
    console.log(login)

    login.$save (result)->
      console.log result
      if result.user.name
        $scope.setUser(result.user)
      else
        alert('user does not exist')


  $scope.checkLogin = ->
    CheckLogin.get({},(data)->
      console.log 'getting login'
      console.log data
      $scope.setUser(data.user))

  $scope.init()

#
#  $scope.addThing = ->
#    return if $scope.newThing is ''
#    $http.post '/api/things',
#      name: $scope.newThing
#
#    $scope.newThing = ''
#
#  $scope.deleteThing = (thing) ->
#    $http.delete '/api/things/' + thing._id
]
