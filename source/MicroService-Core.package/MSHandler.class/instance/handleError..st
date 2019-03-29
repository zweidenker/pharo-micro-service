accessing
handleError: error
	^ (error isKindOf: MSError)
		ifTrue: [ error ]
		ifFalse: [  
			self logError: error.
			MSUnhandledError new 
				errorClassName: error class name;
				messageText: error description ]