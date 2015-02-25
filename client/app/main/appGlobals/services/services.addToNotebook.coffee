angular.module 'landerApp'
.service 'addToNotebook',['$http','$q',($http,$q)->
	return (body)->
		defer = $q.defer()
		$http.put '/api/things/notebooks',body
		.success (res)->
			defer.resolve(res)
		.error (err,status)->
			defer.reject(err)
  ]
