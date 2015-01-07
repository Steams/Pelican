'use strict'

angular.module 'landerApp'
.controller 'MainCtrl',['$scope','$resource','$http',($scope,$resource,$http) ->

  Notes = $resource('/api/things/notes')
  EnglishNotes = $resource('/api/things/notes/English')


  Notes.query((result)->
    $scope.notes = result
    $scope.notes.push({subject:'blank'})
    console.log($scope.notes)
  )

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
  #     subject:'Engineering',
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
