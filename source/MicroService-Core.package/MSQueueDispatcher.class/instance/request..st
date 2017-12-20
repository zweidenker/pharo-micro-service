accessing
request: aRequest
	^ self 
		send: (self serialize: aRequest)
		toQueue: '/topic/', aRequest class routingKey
		headers: { #requestClass -> aRequest class className } asDictionary
		sync: true