'use strict'

angular.module 'landerApp'
.controller 'MainCtrl',['$scope','$resource','$sce','notesFactory',($scope,$resource,$sce,notesFactory) ->

  $scope.notes = ()-> return notesFactory.notes #keep notes up to date by always checking factory when referecing it

  $scope.init = ()->
    notesFactory.queryNotes()
    $scope.checkLogin()
    $scope.editor =  document.getElementsByClassName('ta-bind')[0]
    setTimeout(()->
      $scope.openNote 0
    ,30)

  $scope.holder = {}
#  editor =  document.getElementsByClassName('ta-bind')[0]
  Notes = $resource('/api/things/notes/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  menu = document.querySelector '#menu'

#  $scope.getNote = (id)->
#    Notes.get({id:id},(data)->
#      console.log 'getting note...'
#      content = data.list[0].content
#      editor.innerHTML= content
#    )

  $scope.openNote =(index)->
    $scope.selected = index;
    editor =  document.getElementsByClassName('ta-bind')[0]
    editor.innerHTML = $scope.notes()[index].content
    view = {}
    view.noteId = $scope.notes()[index].id
    view.userName = $scope.name
    notesFactory.view(view);
    # console.log('Viewing note title : '+ $scope.notes()[index].title +'Viewed by : '+view.userName)

    # editor.innerHTML = $scope.notes().find({title:index}).content

  $scope.likeNote = ()->
    console.log('selected :'+$scope.selected)
    index = $scope.selected
    editor = document.getElementsByClassName('ta-bind')[0]
    like = {}
    like.noteId = $scope.notes()[index].id
    like.userName = $scope.name;
    # make service for liking note
    notesFactory.like(like)
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
    note.author = $scope.submitAuthor
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    $scope.submitSubject = ''
    note.content = $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()
    notesFactory.submit(note)

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
