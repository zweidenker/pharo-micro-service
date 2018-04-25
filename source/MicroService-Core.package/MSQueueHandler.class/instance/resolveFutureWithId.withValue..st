responding
resolveFutureWithId: id withValue: response 
	[ [ (futures 
			at: id 
			ifAbsent: [ 
				MSUtils logError: 'did not find future for ', id asString. ^ self ]) resolve: response ]
		on: Error 
		do: [ :err |
			MSUtils logError: err messageText.
			(futures at: id) resolveError: err.
			Smalltalk
				at: #ExceptionReporter
				ifPresent: [ :cls | cls handleException: err ] ] ] fork