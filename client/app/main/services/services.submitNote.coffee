angular.module 'landerApp'
.service 'submitNote', ['$http','api',($http,api,note)->
    return (note)->
      console.log 'making submit http request to: '+api
      $http.post api, note
      .success (data,status,headers,config) ->
        console.log(data)
        return data
      .error (data,status,headers,config) ->
        console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
  ]
