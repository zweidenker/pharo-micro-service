accessing
sendResponse: response headers: aDictionary to: queue
	self 
		sendJSONObject: response 
		headers: (aDictionary copyWith: ('responseClass' -> response class name))
		to: queue