accessing
dispatchRequest: aRequest headers: dict
	| d |
	d := dict copy.
	d at: #requestClass put: aRequest class name.
	^ self 
		sendRequest: aRequest
		toQueue: bindingKey
		headers: d