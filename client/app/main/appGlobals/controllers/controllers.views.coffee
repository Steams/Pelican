'use strict'

angular.module 'landerApp'
.controller 'viewCtrl',['$scope','$resource','$sce','notesFactory','$location',($scope,$resource,$sce,notesFactory,$location) ->

  $scope.notes = ()-> return notesFactory.notes #keep notes up to date by always checking factory when referecing it
  $scope.selected = ()-> return notesFactory.selected
  $scope.selectNote = (index)-> return notesFactory.selectNote(index)
  $scope.loadNotes = (query)-> return notesFactory.loadNotes(query)
  $scope.init = ()->
    console.log('Logging Params')
    console.log($location.search())
    searchObj = $location.search()
    query = '?'
    url = $location.url().split('/')
    console.log(url)
    if(url.length >2 )
      query +='author='+url[2].split('?')[0]+'&'#strip out any queryies after the route name
    else
      if(searchObj.author)
        query +='author='+searchObj.author+'&'
    if(searchObj.subject)
      query+='subject='+searchObj.subject+'&'
    if(searchObj.title)
      query +='title='+searchObj.title+'&'
    if(searchObj.community)
      query +='community='+searchObj.community+'&'
    console.log(query)
    notesFactory.loadNotes(query)

    $scope.checkLogin()
    $scope.viewPanel =  document.getElementById('viewPanel')
    setTimeout(()->
      $scope.openNote 0
    ,30)

  $scope.holder = {}
  Notes = $resource('/api/things/notes/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  menu = document.querySelector '#menu'

  $scope.openNote =(id)->
    $scope.selectNote(id)
    console.log('id : '+id)
    console.log('selected now : '+$scope.selected())
    # console.log(notesFactory.selected)
    viewPanel =  document.getElementById('viewPanel')
    viewPanel.innerHTML = $scope.selected().content
    view = {}
    view.noteId = $scope.selected().id
    view.userName = $scope.name
    notesFactory.view(view);

  $scope.likeNote = ()->
    console.log('selected :'+ $scope.selected)
    like = {}
    like.noteId = $scope.selected().id
    like.userName = $scope.name;
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
    note.author = $scope.submitAuthor
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    $scope.submitSubject = ''
    note.content = $sce.trustAsHtml(document.getElementById('viewPanel').innerHTML).valueOf()
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
    document.getElementById('viewPanel').innerHTML = " "

  $scope.init()
]