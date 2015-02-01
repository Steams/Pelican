angular.module 'landerApp'
.factory 'eventsFactory', ['indexModel',(indexModel)->

  factory = this
  factory.events = []
  factory.selected= factory.events[0]

  factory.selectEvent = (index)->
    factory.selected = factory.events[index]
    return factory.events[index]

  factory.indexEvents = ()->
    indexModel('/api/things/events').then(#get events returns a promise
      (res)->
        factory.events = res
        console.log res,#on promise resolved
      (err)-> console.log err #on promise rejected
    )
    factory.events.push({subject:'blank'})

  # factory.submit = (community)-> factory.events.splice -1,0,submitcommunity(community)

  # factory.loadList = (subject)->
  #   geteventsBySubject(subject).then(
  #     (res)->
  #       if(res.list)
  #         factory.events = res.list
  #       else
  #         factory.events = res
  #       factory.events.push({subject:'blank'})
  #       console.log(factory.events)
  #     ,
  #     (err)-> console.log err
  #   )
  return factory
]
