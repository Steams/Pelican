# angular.module 'landerApp'
# .service 'likeNote', ['$http','api',($http,api)->
#     return (like)->
#       # console.log 'making submit http request to: '+api
#       $http.post '/api/things/Likes', like
#       .success (data,status,headers,config) ->
#         console.log(data)
#         return data
#       .error (data,status,headers,config) ->
#         console.log 'data: '+data+'|status: '+status+'|headers: '+headers+'|config: '+config
#   ]