angular.module 'landerApp'
.factory 'notebooksFactory', ['indexModel',(indexModel)->

  factory = this
  factory.notebooks = []
  factory.selected= factory.notebooks[0]

  factory.selectNotebook = (index)->
    factory.selected = factory.notebooks[index]
    return factory.notebooks[index]

  factory.indexNotebooks = ()->
    indexModel('/api/things/notebooks').then(#get notebooks returns a promise
      (res)->
        factory.notebooks = res
        console.log res,#on promise resolved
      (err)-> console.log err #on promise rejected
    )
    factory.notebooks.push({subject:'blank'})

  # factory.submit = (community)-> factory.notebooks.splice -1,0,submitcommunity(community)

  # factory.loadList = (subject)->
  #   getnotebooksBySubject(subject).then(
  #     (res)->
  #       if(res.list)
  #         factory.notebooks = res.list
  #       else
  #         factory.notebooks = res
  #       factory.notebooks.push({subject:'blank'})
  #       console.log(factory.notebooks)
  #     ,
  #     (err)-> console.log err
  #   )
  return factory
]
