accessing
sendResponse: response to: queue headers: aDictionary
	self
		sendJSONObject: response
		to: queue
		headers: (aDictionary copyWith: ('responseClass' -> response class name))