angular.module 'landerApp'
.service 'likeNote', ['$http','api',($http,api)->
    return (like)->
      $http.post '/api/things/Likes', like
      .success (data,status,headers,config) ->
        # console.log(data)
        return data
      .error (data,status,headers,config) ->
        console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
  ]
