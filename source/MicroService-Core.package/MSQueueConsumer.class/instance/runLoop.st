accessing
runLoop
	| subscription frame |
	[ 
	self openClient.
	subscription := (self client newSubscriptionTo: bindingKey).
	frame := subscription subscribeFrame.
	headers keysAndValuesDo: [ :name :value |
		frame headerAt: name put: value ].
	self client write: frame.
	
	[ self client runWith: [ :message | 
			[ self handleMessage: message ]
			on: Error 
			do: [ :err |
				(err class = ConnectionTimedOut) ifTrue: [ err pass ].
				self 
					sendResponse: (MSError fromError: err)
					headers: Dictionary new
					to: (self responseQueueFor: message)
				  ] ] ]
		on:Error 
		do: [:err | 
			MSUtils logError: err messageText.
			Smalltalk 
				at: #ExceptionReporter
				ifPresent: [ :cls | cls handleException: err ]].
		self reset. 
		MSUtils logDebug: 'restarting runLoop' ] repeat	