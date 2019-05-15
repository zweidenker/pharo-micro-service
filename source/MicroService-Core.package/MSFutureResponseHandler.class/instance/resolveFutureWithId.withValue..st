responding
resolveFutureWithId: id withValue: response 
	[ [ response isError 
			ifTrue: [ (futures at: id) deployFailure: response ] 
			ifFalse: [ (futures at: id) deploySuccess: response ] ]
		on: Error 
		do: [ :err |
			MSUtils logError: err messageText.
			futures at: id ifPresent: [:f | f deployFailure: err ].
			Smalltalk
				at: #SnapDump
				ifPresent: [ :cls | cls handleException: err ] ] ] fork