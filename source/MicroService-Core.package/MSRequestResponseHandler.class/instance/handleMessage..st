accessing
handleMessage: message
	| time request response headers |
	MSUtils logInfo: 'got message: ', message asString.
	time := [ 
		request := self materializeRequestFrom: message.
		response := self handleRequest: request.
		headers := Dictionary new.
		(message headerAt: 'reply-to' ifAbsent: [nil]) isNil
			ifTrue: [ 
				headers at: 'correlation-id' put: (message headerAt: 'correlation-id') ].
		queue
			sendResponse: response
			headers: headers
			to: (self responseQueueFor: message) ] timeToRun.
	MSUtils logDebug: 'time = ', time asString