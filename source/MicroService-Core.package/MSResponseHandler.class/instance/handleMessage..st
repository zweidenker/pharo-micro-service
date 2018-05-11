accessing
handleMessage: message
	| response |
	MSUtils logInfo: 'got message: ', message asString.
	response := self materializeResponseFrom: message.
	^ [ self handleResponse: response headers: message headers ]
		on: Error
		do: [ :err | self handleError: err ]
