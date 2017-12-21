accessing
start
	self ensureQueueIsPresent.
	process := [ 
		[ self runLoop ]
		on: Error 
		do: [ :error |
			MSUtils logError: error.
			Smalltalk 
				at: #ExceptionReporter
				ifPresent: [ :reporter | reporter handleException: error ] ] ] fork