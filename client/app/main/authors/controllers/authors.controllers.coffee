'use strict'

angular.module 'landerApp'
.controller 'authorsCtrl',['$scope','$resource','$sce','authorsFactory',($scope,$resource,$sce,authorsFactory) ->

  $scope.authors = ()-> return authorsFactory.authors #keep authors up to date by always checking factory when referecing it
  $scope.selected = ()-> return authorsFactory.selected
  $scope.selectAuthor = (index)-> return authorsFactory.selectAuthor(index)
  $scope.init = ()->
    authorsFactory.indexAuthors()
    $scope.checkLogin()
    $scope.editor =  document.getElementById('editor')
    setTimeout(()->
      $scope.openAuthor 0
    ,30)

  $scope.holder = {}
#  editor =  document.getElementById('editor')
  authors = $resource('/api/things/authors/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  Subjectauthors = $resource('/api/things/authors/subjects/:id')
  menu = document.querySelector '#menu'

#  $scope.getNote = (id)->
#    authors.get({id:id},(data)->
#      console.log 'getting note...'
#      content = data.list[0].content
#      editor.innerHTML= content
#    )

  $scope.openAuthor =(index)->
  #   $scope.selectAuthor(index)
  #   console.log('index : '+index)
  #   console.log('selected now : '+$scope.selected())
  #   # console.log(authorsFactory.selected)
  #   editor =  document.getElementById('editor')
  #   editor.innerHTML = $scope.selected().content
  #   view = {}
  #   view.noteId = $scope.selected().id
  #   view.userName = $scope.name
  #   authorsFactory.view(view);
    # console.log('Viewing note title : '+ $scope.authors()[index].title +'Viewed by : '+view.userName)

    # editor.innerHTML = $scope.authors().find({title:index}).content

  # $scope.likeNote = ()->
  #   console.log('selected :'+ $scope.selected)
  #   editor = document.getElementById('editor')
  #   like = {}
  #   like.noteId = $scope.selected().id
  #   like.userName = $scope.name;
  #   # make service for liking note
  #   if authorsFactory.like(like) != 500
  #     $scope.selected().likeCount++
  #   # console.log('Liked note title : '+$scope.authors()[index].title+'Liked note User :'+like.userName)

  # $scope.loadList = (subject)->
  #  authorsFactory.loadList(subject)

  # $scope.submitNote = ->
  #   console.log 'submiting note...'
  #   note = new authors()
  #   note.title = $scope.submitTitle
  #   $scope.submitTitle = ''
  #   note.desc = $scope.submitDesc
  #   $scope.submitDesc =''
  #   note.author = $scope.submitAuthor
  #   $scope.submitAuthor=''
  #   note.subject = $scope.submitSubject
  #   $scope.submitSubject = ''
  #   note.content = $sce.trustAsHtml(document.getElementById('editor').innerHTML).valueOf()
  #   authorsFactory.submit(note)

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

  # $scope.createNote =()->
  #   console.log('hhbiyuyg')
  #   document.getElementById('editor').innerHTML = " "

  $scope.init()
]