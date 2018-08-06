accessing
handleError: error
	^ (error isKindOf: MSError)
		ifTrue: [ error ]
		ifFalse: [  
			(CurrentExecutionEnvironment value isKindOf: TestExecutionEnvironment) ifTrue: [ error pass ].
			self logError: error.
			MSError new 
				errorClassName: error class name;
				messageText: error description ]