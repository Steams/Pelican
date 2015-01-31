'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
    $stateProvider
        .state('main',{
        url: '/'
        templateUrl: 'app/main/index.html'
        controller: 'MainCtrl'}
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
        .state('notes',{
        url:'/notes'
        templateUrl:'app/main/notes/notes.html'
        controller:'viewCtrl'}
        )
       .state('communities',{
       url:'/communities'
       templateUrl:'app/main/communities/communities.html'
       controller:''}
       )
       .state('authors',{
       url:'/authors'
       templateUrl:'app/main/authors/authors.html'
       controller:'authorsCtrl'}
       )
#    .state('events',{
#    url:''
#    templateUrl:''
#    controller:''}
#    )

