accessing
dispatchRequest: aRequest sync: aBoolean
	^ self 
		sendRequest: aRequest
		toQueue: bindingKey
		headers: { #requestClass -> aRequest class name } asDictionary
		sync: aBoolean