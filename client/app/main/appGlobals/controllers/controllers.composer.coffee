'use strict'

angular.module 'landerApp'
.controller 'composerCtrl',['$scope','$resource','$sce','notesFactory','mainFactory',($scope,$resource,$sce,notesFactory,mainFactory) ->

  # $scope.notes = ()-> return notesFactory.notes #keep notes up to date by always checking factory when referecing it
  # $scope.selected = ()-> return notesFactory.selected
  # $scope.heading = 'Heading'
  $scope.setUser = (user)-> mainFactory.setUser(user)
  $scope.setHeading = (heading)-> mainFactory.setSearchHeading(heading)
  $scope.heading = ()-> return mainFactory.searchHeading
  $scope.user = ()-> return mainFactory.user

  $scope.init = ()->
    $scope.checkLogin()

  $scope.holder = {}
#  editor =  document.getElementsByClassName('ta-bind')[0]
  Notes = $resource('/api/things/notes/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  menu = document.querySelector '#menu'

  $scope.openNote =(index)->
    notesFactory.selectNote(index)
    console.log('index : '+index)
    # console.log('selected now : '+$scope.$parent.$parent.selected)
    editor =  document.getElementsByClassName('ta-bind')[0]
    editor.innerHTML = notesFactory.selected().content
    view = {}
    view.noteId = $scope.notes()[index].id
    view.userName = $scope.user().name
    notesFactory.view(view);
    # console.log('Viewing note title : '+ $scope.notes()[index].title +'Viewed by : '+view.userName)

    # editor.innerHTML = $scope.notes().find({title:index}).content

  $scope.likeNote = ()->
    console.log('selected :'+$scope.selected())
    # console.log($scope)
    editor = document.getElementsByClassName('ta-bind')[0]
    like = {}
    like.noteId = $scope.selected().id
    like.userName = $scope.user().name
    # make service for liking note
    if notesFactory.like(like) != 500
      $scope.selected().likeCount++
    # console.log('Liked note title : '+$scope.notes()[index].title+'Liked note User :'+like.userName)

  $scope.loadList = (subject)->
   notesFactory.loadList(subject)

  $scope.submitNote = ->
    console.log 'submiting note...'
    note = new Notes()
    note.title = $scope.submitTitle
    $scope.submitTitle = ''
    note.desc = $scope.submitDesc
    $scope.submitDesc =''
    note.author = $scope.user().name
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    $scope.submitSubject = ''
    note.content = $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()
    notesFactory.submit(note)

  $scope.createNote =()->
    console.log('hhbiyuyg')
    document.getElementsByClassName('ta-bind')[0].innerHTML = " "

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
