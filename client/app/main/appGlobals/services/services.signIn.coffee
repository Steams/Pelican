angular.module 'landerApp'
.service 'signIn',['$http','api','$q',($http,api,$q)->
    return (user)->
      # console.log 'making submit http request to: '+api
      $http.post '/login', user
      .success (data,status,headers,config) ->
        console.log(data)
        return data
      .error (data,status,headers,config) ->
        console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
  ]
