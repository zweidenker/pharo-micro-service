accessing
handleMessage: message
	| time request response outgoingHeaders |
	MSUtils logInfo: 'got message: ' , message asString.
	time := [ request := self materializeRequestFrom: message.
	response := self handleRequest: request.
	outgoingHeaders := Dictionary new.
	self copyHeaders
		do: [ :key | 
			message headers
				at: key
				ifPresent: [ :value | 
					MSUtils
						logInfo: 'copyheader ' , key asString , ' with value ' , value asString.
					outgoingHeaders at: key put: value ] ].
	headers
		keysAndValuesDo: [ :name :value | 
			MSUtils logDebug: 'copying header ' , name , ' with value ' , value.
			outgoingHeaders at: name put: value ].
	queue
		sendResponse: response
		to: (self responseQueueFor: message)
		headers: outgoingHeaders ] timeToRun.
	MSUtils logDebug: 'time = ' , time asString