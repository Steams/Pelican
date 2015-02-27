angular.module 'landerApp'
.factory 'notebooksFactory', ['indexModel',(indexModel)->

  factory = this
  factory.notebooks = []
  factory.selected= factory.notebooks[0]

  factory.selectNotebook = (index)->
    factory.selected = factory.notebooks[index]
    return factory.notebooks[index]

  factory.indexNotebooks = ()->
    indexModel('/api/things/notebooks').then(
      (res)->
        factory.notebooks = res
        console.log res,
      (err)-> console.log err
    )
    factory.notebooks.push({subject:'blank'})


  return factory
]
