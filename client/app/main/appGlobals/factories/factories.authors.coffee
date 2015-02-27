angular.module 'landerApp'
.factory 'authorsFactory', ['indexModel',(indexModel)->

  factory = this
  factory.authors = []
  factory.selected= factory.authors[0]

  factory.selectAuthor = (name)->
    factory.selected = $.grep(factory.authors, (e)-> return e.name == name)[0]
    return factory.selected

  factory.indexAuthors = ()->
    console.log('indexing authors')
    indexModel('/api/things/authors').then(#get authors returns a promise
      (res)->
        factory.authors = res
        # console.log res,#on promise resolved
      (err)->
        console.log err #on promise rejected
    )
    factory.authors.push({subject:'blank'})

  return factory
]
