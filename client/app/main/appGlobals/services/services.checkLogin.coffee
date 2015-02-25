angular.module 'landerApp'
.service 'checkLogin',['$http','api','$q',($http,api,$q)->
	return ()->
		defer = $q.defer()
		$http.get '/loginInfo'
		.success (res)->
			defer.resolve(res)
		.error (err,status)->
			defer.reject(err)
  ]
