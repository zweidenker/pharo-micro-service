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
						response := (error isKindOf: MSError)
							ifTrue: [ error ]
							ifFalse: [  
								debugMode ifTrue: [ error pass ].
								MSUtils logError: error.
								Smalltalk  
									at: #ExceptionReporter
									ifPresent: [ :reporter | reporter handleException: error ].
				 				MSError new 
									errorClassName: error class name;
									messageText: error description ]].
				self 
					sendResponse: response
					to: (self responseQueueFor: message) ] timeToRun.
			MSUtils logDebug: 'time = ', time asString ]