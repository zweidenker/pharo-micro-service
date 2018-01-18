accessing
start
	self ensureQueueIsPresent.
	process := [ 
		[ 
			MSUtils logInfo: 'Starting run loop'.
			self runLoop ]
		on: Error 
		do: [ :error |
			MSUtils logError: error.
			debugMode ifTrue: [ error pass ].
			Smalltalk 
				at: #ExceptionReporter
				ifPresent: [ :reporter | reporter handleException: error ] ] ] forkNamed: 'queue consumer for: ', bindingKey asString