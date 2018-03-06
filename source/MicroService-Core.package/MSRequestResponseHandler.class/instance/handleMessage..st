accessing
handleMessage: message
	| time request response outgoingHeaders |
	MSUtils logInfo: 'got message: ', message asString.
	time := [ 
		request := self materializeRequestFrom: message.
		response := self handleRequest: request.
		outgoingHeaders := Dictionary new.
		(message headerAt: 'reply-to' ifAbsent: [nil]) isNil
			ifTrue: [ 
				outgoingHeaders at: 'correlation-id' put: (message headerAt: 'correlation-id') ]
			ifFalse: [ 		
				headers keysAndValuesDo: [ :name :value |
					MSUtils logDebug: 'copying header ', name, ' with value ', value.
					outgoingHeaders at: name put: value ] ].
		queue
			sendResponse: response
			headers: outgoingHeaders 
			to: (self responseQueueFor: message) ] timeToRun.
	MSUtils logDebug: 'time = ', time asString