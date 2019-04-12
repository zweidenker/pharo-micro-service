accessing
runLoop
	| subscription frame |
	[ self openClient: self receiverClient.
	MSUtils
		logInfo: 'receiver client subscribe to: ' , receiverQueue asString.
	subscription := self receiverClient newSubscriptionTo: receiverQueue.
	frame := subscription subscribeFrame.
	frame headerAt: 'auto-delete' put: 'true'.
	self receiverClient write: frame.
	[ [ self receiverClient
		runWith: [ :message | self handleMessage: message ] ]
		on: ZnIncomplete
		do: [ :incompleteError | "Workaround for ticket MAP-1178.
			This error seems to be raised within a specific scenario: the socket stream get closed while the #next method is waiting for data (ZnAbstractSocketStream >> next).
			I reported and commented this case here: https://github.com/svenvc/stamp/pull/5
			For now, we assume the connection has been closed and just let the loop run again.
			If the connection remain closed, #openClient: will take care of acting accordingly
			" MSUtils logError: incompleteError messageText ] ]
		on: Error
		do: [ :err | 
			MSUtils logError: err messageText.
			Smalltalk
				at: #ExceptionReporter
				ifPresent: [ :cls | cls handleException: err ] ].
	self resetReceiver.
	MSUtils logDebug: 'restarting runLoop' ] repeat