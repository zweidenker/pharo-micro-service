accessing
runLoop
	| subscription frame |
	[ 
	self openClient: self receiverClient.
	MSUtils logInfo: 'receiver client subscribe to: ', receiverQueue asString.
	subscription := (self receiverClient newSubscriptionTo: receiverQueue).
	frame := subscription subscribeFrame.
	frame headerAt: 'auto-delete' put: 'true'.
	self receiverClient write: frame.
	
	[ self receiverClient runWith: [ :message | self handleMessage: message ] ]
		on:Error 
		do: [:err | 
			MSUtils logError: err messageText.
			Smalltalk 
				at: #SnapDump
				ifPresent: [ :cls | cls handleException: err ]].
		self resetReceiver. 
		MSUtils logDebug: 'restarting runLoop' ] repeat	