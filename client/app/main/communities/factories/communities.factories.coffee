angular.module 'landerApp'
.factory 'communitiesFactory', ['indexModel',(indexModel)->

  factory = this
  factory.communities = []
  factory.selected= factory.communities[0]

  factory.selectCommunity = (index)->
    factory.selected = factory.communities[index]
    return factory.communities[index]

  factory.indexCommunities = ()->
    indexModel('/api/things/communities').then(
      (res)->
        factory.communities = res
        # console.log res,
      (err)->
        console.log err
    )
    factory.communities.push({subject:'blank'})
  return factory
]
