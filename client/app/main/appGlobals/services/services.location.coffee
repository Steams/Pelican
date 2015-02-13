angular.module 'landerApp'
.service 'whereAmI',['$location',($location)->
	return ()->
		searchObj = $location.search()
		url = $location.url().split('/')
		console.log('Getting location url :'+url)
		if url[1] == 'authors'
			return ""+url[2].split('?')[0]+"\'s  Notes"
		if url[1]=='notes'
			return 'All Notes'
		if url[1]=='subjects'
			return ""+url[2].split('?')[0]+" Notes"
		if searchObj.author
			return ""+searchObj.author+"\'s Notes"
		else
			if searchObj.community
				return 'Notes from '+searchObj.community
			else
				if searchObj.subject
					return ''+searchObj.subject+' Notes'
				else
					if searchObj.tags
						return searchObj.tags+' related Notes'
		return 'All Notes'
	]