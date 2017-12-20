accessing
runLoop

	self client 
		open; 
		subscribeTo: bindingKey;
		runWith: [ :message | | time request response |
			MSUtils logInfo: 'got request: ', message asString.
			time := [ 
				request := self materializeRequestFrom: message.
				response := self handleRequest: request.
				self 
					send: (self serialize: response)
					to: (self responseQueueFor: message) ] timeToRun.
			MSUtils logDebug: 'time = ', time asString ]
	
