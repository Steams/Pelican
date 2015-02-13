# this factory should handle, 
# sending validate login
# storing current user
# storing current page
# changing url. if not $controller
# storing seaerch panel current heading
# turn username into user object by querying users api

angular.module 'landerApp'
.factory 'mainFactory', ['indexModel','whereAmI',(indexModel,whereAmI)->

	factory = this
	factory.user =''
	factory.searchHeading =''

	factory.getLocation = ()->
		return whereAmI()
		
	factory.setUser = (user)->
		factory.user = user
		return factory.user

	factory.setSearchHeading = (heading)->
		factory.searchHeading = heading
		return factory.searchHeading

	return factory
]