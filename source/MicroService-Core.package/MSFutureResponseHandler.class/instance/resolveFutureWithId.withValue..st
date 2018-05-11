responding
resolveFutureWithId: id withValue: response 
	[ [ response isError 
			ifTrue: [ (futures at: id) resolveError: response ] 
			ifFalse: [ (futures at: id) resolve: response ] ]
		on: Error 
		do: [ :err |
				err pass.
			MSUtils logError: err messageText.
			futures at: id ifPresent: [:f | f resolveError: err ].
			Smalltalk
				at: #ExceptionReporter
				ifPresent: [ :cls | cls handleException: err ] ] ] fork