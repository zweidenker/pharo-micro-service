accessing
runLoop

	self client 
		open; 
		subscribeTo: bindingKey;
		runWith: [ :message | | time request response |
			MSUtils logInfo: 'got request: ', message asString.
			time := [ 
				[  request := self materializeRequestFrom: message.
					response := self handleRequest: request ]
					on: Error
					do: [ :error | 
						MSUtils logError: error.
						Smalltalk  
							at: #ExceptionReporter
							ifPresent: [ :reporter | reporter handleException: error ].
				 		response := MSErrorResponse new 
							errorClassName: error class name;
							description: error description ].
				self 
					sendResponse: response
					to: (self responseQueueFor: message) ] timeToRun.
			MSUtils logDebug: 'time = ', time asString ]