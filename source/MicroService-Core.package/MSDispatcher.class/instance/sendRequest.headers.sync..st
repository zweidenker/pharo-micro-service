accessing
sendRequest: aRequest headers: dict sync: aBoolean
	| response |
	response := self dispatchRequest: aRequest headers: dict sync: aBoolean.
	response isError ifTrue: [ 
		response signal ].
	^ response 