accessing
handleMessage: message
	| time request response |
	MSUtils logInfo: 'got message: ', message asString.
	time := [ 
		request := self materializeRequestFrom: message.
		response := self handleRequest: request.
		queue
			sendResponse: response
			to: (self responseQueueFor: message) ] timeToRun.
	MSUtils logDebug: 'time = ', time asString