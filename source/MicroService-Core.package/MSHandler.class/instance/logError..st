accessing
logError: error
	MSUtils logError: error.
	Smalltalk  
		at: #ExceptionReporter
		ifPresent: [ :reporter | reporter handleException: error ].