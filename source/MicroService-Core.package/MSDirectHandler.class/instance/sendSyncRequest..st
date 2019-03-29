accessing
sendSyncRequest: aRequest
	| response |
	response := self handleRequest: aRequest.
	response isError ifTrue: [ 
		response signal ].
	^ response