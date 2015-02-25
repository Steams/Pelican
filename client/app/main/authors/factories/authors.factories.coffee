angular.module 'landerApp'
.factory 'authorsFactory', ['indexModel',(indexModel)->

  factory = this
  factory.authors = []
  factory.selected= factory.authors[0]

  factory.selectAuthor = (name)->
    factory.selected = $.grep(factory.authors, (e)-> return e.name == name)[0]
    return factory.selected

  factory.indexAuthors = ()->
    indexModel('/api/things/authors').then(#get authors returns a promise
      (res)->
        factory.authors = res
        console.log res,#on promise resolved
      (err)-> console.log err #on promise rejected
    )
    factory.authors.push({subject:'blank'})

  # factory.submit = (community)-> factory.authors.splice -1,0,submitcommunity(community)

  # factory.loadList = (subject)->
  #   getauthorsBySubject(subject).then(
  #     (res)->
  #       if(res.list)
  #         factory.authors = res.list
  #       else
  #         factory.authors = res
  #       factory.authors.push({subject:'blank'})
  #       console.log(factory.authors)
  #     ,
  #     (err)-> console.log err
  #   )
  return factory
]
