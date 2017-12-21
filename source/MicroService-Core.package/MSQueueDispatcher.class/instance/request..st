accessing
request: aRequest
	^ self 
		sendRequest: aRequest
		toQueue: '/topic/', aRequest class routingKey
		headers: { #requestClass -> aRequest class name } asDictionary
		sync: true