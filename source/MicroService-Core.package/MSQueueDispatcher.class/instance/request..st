accessing
request: aRequest
	^ self 
		sendRequest: (self serialize: aRequest)
		toQueue: '/topic/', aRequest class routingKey
		headers: { #requestClass -> aRequest class name } asDictionary
		sync: true