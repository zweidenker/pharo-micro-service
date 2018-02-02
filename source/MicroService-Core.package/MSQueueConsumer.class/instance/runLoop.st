accessing
runLoop
	| subscription frame |
	self client open.
	subscription := (self client newSubscriptionTo: bindingKey).
	frame := subscription subscribeFrame.
	headers keysAndValuesDo: [ :name :value |
		frame headerAt: name put: value ].
	self client write: frame.
	self client
		runWith: [ :message | 
			[ self handleMessage: message ]
			on: Error 
			do: [ :err | 
				MSUtils logError: err messageText.
				Smalltalk 
					at: #ExceptionReporter
					ifPresent: [ :cls | cls handleException: err ] ] ].
	Error signal: 'should never arrive here'