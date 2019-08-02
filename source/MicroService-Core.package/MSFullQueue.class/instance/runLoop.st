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
	[ self receiverClient
		runWith: [ :message | 
			[ self handleMessage: message ]
				on: ConnectionTimedOut
				do: [ :ex | 
					MSUtils
						logInfo: 'connection timeout while looping over stamp messages reading'.
					ex pass ] ] ]
		on: Error
		do: [ :err | 
			MSUtils logError: err messageText.
			Smalltalk
				at: #SnapDump
				ifPresent: [ :cls | 
				"fork so that it does not block the auto-restart of the loop."	
				[cls handleException: err] fork ] ].
	self resetReceiver.
	MSUtils logDebug: 'restarting runLoop' ] repeat