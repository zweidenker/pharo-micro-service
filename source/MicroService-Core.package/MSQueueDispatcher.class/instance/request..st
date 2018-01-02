accessing
request: aRequest
	| response |
	response := self 
		sendRequest: aRequest
		toQueue: bindingKey
		headers: { #requestClass -> aRequest class name } asDictionary
		sync: true.
	response isError ifTrue: [ 
		MSGenericError signal: response printString ].
	^ response 