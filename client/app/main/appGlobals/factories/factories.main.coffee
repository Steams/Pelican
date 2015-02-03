# this factory should handle, 
# sending validate login
# storing current user
# storing current page
# changing url. if not $controller
# storing seaerch panel current heading
# turn username into user object by querying users api

angular.module 'landerApp'
.factory 'mainFactory', ['indexModel',(indexModel)->

	factory = this
	factory.user =''
	factory.searchHeading =''

  # factory.selected= factory.authors[0]
  # factory.user;
	factory.setUser = (user)->
		factory.user = user
	  # this shoudl find the user object with that name and set user to it
		return factory.user

	factory.setSearchHeading = (heading)->
		factory.searchHeading = heading
		return factory.searchHeading

	return factory
]