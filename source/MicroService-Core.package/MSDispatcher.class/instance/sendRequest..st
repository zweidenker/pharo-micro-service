accessing
sendRequest: aRequest
	| response |
	response := self dispatchRequest: aRequest.
	response isError ifTrue: [ 
		response signal ].
	^ response 