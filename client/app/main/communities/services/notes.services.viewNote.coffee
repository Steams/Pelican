# angular.module 'landerApp'
# .service 'viewNote', ['$http','api',($http,api)->
#     return (view)->
#       # console.log 'making submit http request to: '+api
#       $http.post '/api/things/views', view
#       .success (data,status,headers,config) ->
#         console.log(data)
#         return data
#       .error (data,status,headers,config) ->
#         console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
#   ]