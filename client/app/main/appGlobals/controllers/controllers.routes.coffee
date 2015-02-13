'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
    $stateProvider
        .state('landing',{
        url: '/'
        templateUrl: 'app/main/landing/landing.html'
        controller: 'globalCtrl'}
        )
        .state('home',{
        url: '/home'
        templateUrl: 'app/main/index.html'
        controller: 'globalCtrl'}
        )
        .state('compose',{
        url: '/compose'
        templateUrl: 'app/main/submit.html'
        controller: 'globalCtrl'}
        )
        .state('login',{
        url:'/login'
        templateUrl:'app/main/login.html'
        controller: 'globalCtrl'}
        )
        .state('subject',{
        url:'/api/things/notes/subject*'
        templateUrl:'app/main/submit.html'
        controller: 'globalCtrl'}
        )
        .state('notes',{
        url:'/notes'
        templateUrl:'app/main/notes/notes.html'
        controller:'globalCtrl'}
        )
        .state('notesByParam',{
        url:'/notes/:param'
        templateUrl:'app/main/notes/notes.html'
        controller:'globalCtrl'}
        )
        .state('communities',{
        url:'/communities'
        templateUrl:'app/main/communities/communities.html'
        controller:'globalCtrl'}
        )
        .state('authors',{
        url:'/authors'
        templateUrl:'app/main/authors/authors.html'
        controller:'globalCtrl'
        # reloadOnSearch:false
        }
        )
        .state('authorsDetail',{
        url:'/authors/:author'
        templateUrl:'app/main/notes/notes.html'
        controller:'globalCtrl'}
        )
        .state('subjects',{
        url:'/subjects/:subject'
        templateUrl:'app/main/notes/notes.html'
        controller:'globalCtrl'}
        )
        .state('events',{
        url:'/events'
        templateUrl:'app/main/events/events.html'
        controller:'globalCtrl'}
        )
        .state('notebooks',{
        url:'/notebooks'
        templateUrl:'app/main/notebooks/notebooks.html'
        controller:'globalCtrl'}
        )
        .state('apiDoc',{
        url:'/apiDocs'
        templateUrl:'app/main/apiDocs/apiDocs.html'}
        )

