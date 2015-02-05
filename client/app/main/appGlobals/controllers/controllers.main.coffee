'use strict'

angular.module 'landerApp'
.controller 'globalCtrl',['$scope','$resource','$sce','mainFactory','$location',($scope,$resource,$sce,mainFactory,$location) ->

  $scope.getLocation = ()->
    searchObj = $location.search()
    url = $location.url().split('/')
    console.log('Getting location url :'+url)
    if(url[1] == 'authors')
      return ""+url[2].split('?')[0]+"\'s  Notes"
    if searchObj.author
      return ""+searchObj.author+"\'s Notes"
    else
      if searchObj.community
        return 'Notes from '+searchObj.community
      else
        if searchObj.subject
          return ''+searchObj.subject+' Notes'
    return 'All Notes'

  $scope.openView = (url)->
    $location.url(['/'+url])

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
