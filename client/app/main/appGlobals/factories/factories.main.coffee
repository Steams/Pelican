# this factory should handle, 
# sending validate login
# storing current user
# storing current page
# changing url. if not $controller
# storing seaerch panel current heading
# turn username into user object by querying users api

angular.module 'landerApp'
.factory 'mainFactory', ['indexModel','whereAmI','signUp','signIn','$location',(indexModel,whereAmI,signUp,signIn,$location)->

	factory = this
	factory.user =''
	factory.searchHeading =''
	factory.showNav=true

	factory.getLocation = ()->
		return whereAmI()

	factory.setUser = (user)->
		factory.user = user
		return factory.user

	factory.setSearchHeading = (heading)->
		factory.searchHeading = heading
		return factory.searchHeading

	factory.signIn = (user)->
		console.log 'user'
		console.log user
		signIn(user).then(
			(res)->
				console.log 'sign in res'
				console.log res
				if res.data.user.name
					factory.setUser(res.data.user)
					$location.url('/home')
				else
					alert('user does not exist')
				return res
			,
			(err)->
				console.log err
				return err
		)

	factory.signUp = (user)->
		return signUp(user).then(
			(res)->
				console.log 'signUp res'
				console.log res
				console.log res.status
				obj= {}
				obj.username = res.data.name
				obj.password = res.data.password
				factory.signIn(obj)
				return res
			,
			(err)->
				console.log err
				console.log err.status
				return err.status
		)

	return factory
]