accessing
handleError: error
	^ (error isKindOf: MSError)
		ifTrue: [ error ]
		ifFalse: [  
			"self debugMode ifTrue: [ error pass ]."
			self logError: error.
			MSError new 
				errorClassName: error class name;
				messageText: error description ]