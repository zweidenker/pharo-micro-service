accessing
handleRequestWithErrors: aRequest
	| response |
	response := self handleRequest: aRequest.
	response isError
		ifTrue: [ 
			"no need for snap dump report here.
			it is the responsibility of the request initiator to handle the exception properly "
			response signal ].
	^ response