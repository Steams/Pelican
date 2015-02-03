angular.module 'lander.directives.authorsList', []
.directive 'authorsList', () ->
	return {
		restrict : 'E'
		scope :true
		replace : true
		templateUrl: 'app/main/authors/authorsList.html'
		controller : "authorsCtrl"
  }
.directive 'authorsDetail', () ->
	return {
		restrict:'E'
		scope:true
		replace:true
		templateUrl:'app/main/authors/authorsDetail.html'
		controller:'authorsCtrl'
	}
