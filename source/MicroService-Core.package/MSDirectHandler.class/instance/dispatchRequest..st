public
dispatchRequest: request
	| convertedRequest |
	convertedRequest := self convertObject: request.
	^ convertedRequest directCall: delegate