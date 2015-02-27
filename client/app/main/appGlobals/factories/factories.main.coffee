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
        console.log err
    )
  factory.checkLogin = ()->
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
    console.log 'SetUser'
    factory.user = user
    factory.notebooks = user.Notebooks
    factory.ready=true
    return factory.user

  factory.setSearchHeading = (heading)->
    factory.searchHeading = heading
    return factory.searchHeading

  factory.signIn = (user)->
    # console.log 'user'
    # console.log user
    console.log 'Signing in'
    signIn(user).then(
      (res)->
        # console.log 'sign in res'
        # console.log res
        if res.data.user.name
          factory.setUser(res.data.user)
          $location.url('/home')
        else
          alert('user does not exist')
        return res
      ,
      (err)->
        console.log err
        # return err
    )

  factory.signUp = (user)->
    console.log 'Signing Up'
    signUp(user).then(
      (res)->
        # console.log 'signUp re`s'
        # console.log res
        # console.log res.status
        obj= {}
        obj.username = res.data.name
        obj.password = res.data.password
        factory.signIn(obj)
        return res
      ,
      (err)->
        console.log err
        # console.log err.status
        # return err.status
    )

  return factory
]
