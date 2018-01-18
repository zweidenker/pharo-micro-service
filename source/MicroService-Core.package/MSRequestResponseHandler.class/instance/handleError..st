accessing
handleError: error
	(error isKindOf: MSError)
		ifTrue: [ error ]
		ifFalse: [  
			self debugMode ifTrue: [ error pass ].
			MSUtils logError: error.
			Smalltalk  
				at: #ExceptionReporter
				ifPresent: [ :reporter | reporter handleException: error ].
			MSError new 
				errorClassName: error class name;
				messageText: error description ]