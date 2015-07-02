angular.module 'landerApp'
.factory 'notebooksFactory', ['indexModel','createNotebook',(indexModel,createNotebook)->

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

  factory.createNotebook = (name,username)->
    createNotebook({'name':name,'author':username}).then(
      (res)->
        console.log res
        console.log factory
        factory.notebooks.push res
        # console.log factory.notebooks
        return res
      (err)->

    )
  return factory
]
