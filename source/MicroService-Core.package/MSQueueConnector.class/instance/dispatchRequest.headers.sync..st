accessing
dispatchRequest: aRequest headers: dict sync: aBoolean
	| d |
	d := dict copy.
	d at: #requestClass put: aRequest class name.
	^ self 
		sendRequest: aRequest
		toQueue: bindingKey
		headers: d
		sync: aBoolean