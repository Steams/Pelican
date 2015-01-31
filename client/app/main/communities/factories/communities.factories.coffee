angular.module 'landerApp'
.factory 'communitiesFactory', ['indexModel',(indexModel)->

  factory = this
  factory.communities = []
  factory.selected= factory.communities[0]

  factory.selectCommunity = (index)->
    factory.selected = factory.communities[index]
    return factory.communities[index]

  factory.indexCommunities = ()->
    indexModel('/api/things/communities').then(#get communities returns a promise
      (res)->
        factory.communities = res
        console.log res,#on promise resolved
      (err)-> console.log err #on promise rejected
    )
    factory.communities.push({subject:'blank'})

  # factory.submit = (community)-> factory.communities.splice -1,0,submitcommunity(community)

  # factory.loadList = (subject)->
  #   getcommunitiesBySubject(subject).then(
  #     (res)->
  #       if(res.list)
  #         factory.communities = res.list
  #       else
  #         factory.communities = res
  #       factory.communities.push({subject:'blank'})
  #       console.log(factory.communities)
  #     ,
  #     (err)-> console.log err
  #   )
  return factory
]
