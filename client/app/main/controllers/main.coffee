'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
  $stateProvider
  .state('main',{
    url: '/'
    templateUrl: 'app/main/index.html'
    controller: ''}
#  adding controller above might fix/break scoping problems
  )
  .state('submit',{
     url: '/submit'
     templateUrl: 'app/main/submit.html'
     controller: 'MainCtrl'}
  )
  .state('login',{
     url:'/login'
     templateUrl:'app/main/login.html'
     controller: 'MainCtrl'}
  )
  .state('subject',{
    url:'/api/things/notes/subject*'
    templateUrl:'app/main/submit.html'
    controller: 'MainCtrl'}
  )
