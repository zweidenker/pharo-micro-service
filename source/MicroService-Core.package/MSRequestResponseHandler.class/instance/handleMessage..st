accessing
handleMessage: message
	| time request response |
	MSUtils logInfo: 'got message: ', message asString.
	time := [ 
		request := self materializeRequestFrom: message.
		response := self handleRequest: request.
		queue
			sendResponse: response
			headers: { 'correlation-id' -> (message headerAt: 'correlation-id') } asDictionary 
			to: (self responseQueueFor: message) ] timeToRun.
	MSUtils logDebug: 'time = ', time asString