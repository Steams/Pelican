'use strict'

angular.module 'landerApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'lander.directives.login'
  'lander.directives.header',
  'lander.directives.menu',
  'lander.directives.list',
  'lander.directives.submit',
  'lander.directives.menuButton'
  'lander.directives.viewNotesTemplate',
  'home.directives.home',
  'lander.directives.pulsingButton',
  'lander.directives.expandingPanel',
  'lander.directives.communitiesList',
  'lander.directives.authorsList',
  'lander.directives.navigator',
  'textAngular'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
#  .otherwise '/'

  $locationProvider.html5Mode true

.value('api','/api/things/notes')
