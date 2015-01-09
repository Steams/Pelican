'use strict'

angular.module 'landerApp'
.controller 'MainCtrl',['$scope','$resource','$http','$state','$sce',($scope,$resource,$http,$state,$sce) ->

  $scope.holder = {}
  # document.getElementsByClassName('ta-bind')[0].focus()
  Notes = $resource('/api/things/notes/:id')
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  EnglishNotes = $resource('/api/things/notes/English')
  $scope.notes
  notes=$scope.notes
  # $scope.$watch('notes',() -> alert 'hey, myVar has changed!' )
  # $scope.holder.htmlContent=''
  # $scope.htmlOb ={}
  # console.log $scope.htmlContent.value

  # $scope.updateHtml = (str)->
  #   $scope.htmlOb.strm = str
  #   console.log $scope.htmlOb.strm
  #   $scope.htmlContent =$scope.htmlOb.strm
  # # $scope.updateHtml('blablah')
  # $scope.holder.htmlContent = 'afadfadfa'




  $scope.openNote = (id)->
    # $scope.holder={htmlContent:'gctrxtex'}
    # $scope.holder.htmlContent='gctrxtex'
    # $scope.$parent.holder.htmlContent='gctrxtex'
    console.log $scope
    console.log id
    Note = $resource('/api/things/notes/:id',{id:"@id"})
    note = Note.get({id:id},(data)->
       console.log data.list[0]
       console.log $scope
       console.log $sce.trustAsHtml(data.list[0].content).valueOf()
       content = data.list[0].content
       # document.getElementsByClassName('ta-bind')[0]
       #  $scope.$parent.$$nextSibling.holder.htmlContent
       # = $sce.trustAsHtml(data.content).valueOf()
       document.getElementsByClassName('ta-bind')[0].innerHTML = content
       console.log $scope.$parent.$$nextSibling
       #  console.log $scope.$parent.$$nextSibling
       #  $scope.$parent.$parent.holder.htmlContent = "asduaisuhdoasjd"
    )
    # console.log note.content

    # $scope.holder={htmlContent:'gctrxtex'}
  console.log 'getting'
  Notes.get({id:"54af38dfdc9ef9da1f58084b"},(data)->
      console.log data.list[0].content
      content = data.list[0].content
      document.getElementsByClassName('ta-bind')[0].innerHTML = content
  )


  $scope.loadList = (subject)->
    SubjectNotes.get({id:subject},(data)->
        console.log data.list
        $scope.$parent.notes = data.list
      )
  # Notes.query((result)->
  #   $scope.notes = result
  #   console.log result
  #   $scope.notes.push({subject:'blank'})
  #   console.log($scope.notes)
  # )


  $scope.submitNote = ->
    note = new Notes()
    note.title = $scope.submitTitle
    $scope.submitTitle = ''
    note.desc = $scope.submitDesc
    $scope.submitDesc =''
    note.author = $scope.submitAuthor
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    console.log document.getElementsByClassName('ta-bind')[0].innerHTML
    # console.log 'html content'
    # console.log $scope.holder.htmlContent
    # console.log  $sce.trustAsHtml($scope.holder.htmlContent).valueOf()
    # console.log  $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()
    note.content = $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()

    note.$save (result)->
      console.log(result)
      # $scope.$apply ()->
      # $scope.$parent.notes.push(result)
      $scope.$parent.notes.splice(-1,0,result)
      # Notes.query (result)->
      #   $scope.notes = result
      #   console.log result
      #   $scope.notes.push({subject:'blank'})
      #   console.log($scope.notes)
        # $scope.reloadRoute()

  # $scope.awesomeThings = []
  $scope.name="Radcliffe Robinson"
  # $scope.notes = [
  #   {
  #     subject:'English',
  #     topic:'Punctuation',
  #     author:'Radcliffe Robinson',
  #     desc:'Lecture 3 notes on grammar and punctuation marks'
  #   },
  #   {
  #     subjeat:'Engineering',
  #     topic:'Thermodynamics',
  #     author:'Nicanor Gordon',
  #     desc:'Lecture 10 notes on enthopy and latent heat'
  #   },
  #   {
  #     subject:'Mathematics',
  #     topic:'Proofs',
  #     author:'Kathryn Samuda',
  #     desc:'Lecture 3 notes on proof by induction'
  #   },
  #   {
  #     subject:'English',
  #     topic:'Liturature',
  #     author:'Skai Bucknor',
  #     desc:'Personal notes on to kill a mocking bird'
  #   },
  #   {subject:'blank'}
  # ]

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings


  $scope.addThing = ->
    return if $scope.newThing is ''
    $http.post '/api/things',
      name: $scope.newThing

    $scope.newThing = ''

  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id
]
