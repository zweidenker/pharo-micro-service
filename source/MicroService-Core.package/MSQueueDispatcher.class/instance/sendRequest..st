accessing
sendRequest: aRequest
	| response |
	response := self 
		sendRequest: aRequest
		toQueue: bindingKey
		headers: { #requestClass -> aRequest class name } asDictionary
		sync: true.
	response isError ifTrue: [ 
		response signal ].
	^ response 