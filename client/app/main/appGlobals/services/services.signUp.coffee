angular.module 'landerApp'
.service 'signUp',['$http','api','$q',($http,api,$q)->
    return (user)->
      # console.log 'making submit http request to: '+api
      $http.post '/api/things/authors', user
      .success (data,status,headers,config) ->
        console.log(data)
        return data
      .error (data,status,headers,config) ->
        console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
  ]
