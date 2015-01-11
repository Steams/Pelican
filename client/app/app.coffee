'use strict'

angular.module 'landerApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'lander.directives.header',
  'lander.directives.menu',
  'lander.directives.list',
  'lander.directives.submit',
#  'lander.directives.menuButton'
  'textAngular'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
