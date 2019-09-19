accessing
handleError: error
	^ (error isKindOf: MSError)
		ifTrue: [
			self logError: error. 
			error signal ]
		ifFalse: [  
			self logError: error.
			(MSUnhandledError fromError: error) signal ]