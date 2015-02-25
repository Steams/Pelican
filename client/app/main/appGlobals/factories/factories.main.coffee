# this factory should handle, 
# sending validate login
# storing current user
# storing current page
# changing url. if not $controller
# storing seaerch panel current heading
# turn username into user object by querying users api

angular.module 'landerApp'
.factory 'mainFactory', ['indexModel','whereAmI','signUp','signIn','$location','checkLogin','addToNotebook',
(indexModel,whereAmI,signUp,signIn,$location,checkLogin,addToNotebook)->

	factory = this
	factory.user ={}
	factory.searchHeading =''
	factory.showNav=true
	factory.notebooks = []
	factory.pauseNotebooks = false
	factory.ready = false

	factory.addToNotebook = (id,notebook) ->
		addToNotebook({'noteId':id,'notebookName':notebook}).then(
			(res)->
				$.grep(factory.notebooks, (e)-> return e.name == res.name)[0] = res
				return
			,
			(err)->
				return
		)
	factory.checkLogin = ()->
		# alert 'df'
		console.log 'CheckLogin'
		checkLogin().then(
			(res)->
				console.log res
				if res.data.user.name
					factory.setUser(res.data.user)
				return res
			,
			(err)->
				console.log err
		)

	factory.getLocation = ()->
		return whereAmI()

	factory.setUser = (user)->
		factory.user = user
		factory.notebooks = user.Notebooks
		factory.ready=true
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
		signUp(user).then(
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