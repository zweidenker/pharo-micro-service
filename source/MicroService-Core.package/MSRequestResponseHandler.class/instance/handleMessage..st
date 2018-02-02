accessing
handleMessage: message
	| time request response outgoingHeaders |
	MSUtils logInfo: 'got message: ', message asString.
	time := [ 
		request := self materializeRequestFrom: message.
		response := self handleRequest: request.
		outgoingHeaders := Dictionary new.
		headers keysAndValuesDo: [ :name :value |
			MSUtils logDebug: 'copying header ', name, ' with value ', value.
			outgoingHeaders headerAt: name put: value ].
		(message headerAt: 'reply-to' ifAbsent: [nil]) isNil
			ifTrue: [ 
				#( exclusive ) do: [ :headerName |
					 (message headerAt: headerName ifAbsent: [nil])
						ifNotNil: [ :value |
							MSUtils logDebug: 'copying static header ', headerName, ' with value ', value.
							outgoingHeaders at: headerName put: value ]].
				outgoingHeaders at: 'correlation-id' put: (message headerAt: 'correlation-id') ].
		queue
			sendResponse: response
			headers: outgoingHeaders 
			to: (self responseQueueFor: message) ] timeToRun.
	MSUtils logDebug: 'time = ', time asString