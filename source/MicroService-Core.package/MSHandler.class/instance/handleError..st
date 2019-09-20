accessing
handleError: error
	^ (error isKindOf: MSError)
		ifTrue: [ error ]
		ifFalse: [  
			self logError: error.
			(MSUnhandledError fromError: error) signal ]