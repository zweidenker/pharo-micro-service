accessing
sendRequest: aRequest sync: aBoolean
	| response |
	response := self dispatchRequest: aRequest sync: aBoolean.
	response isError ifTrue: [ 
		response signal ].
	^ response 