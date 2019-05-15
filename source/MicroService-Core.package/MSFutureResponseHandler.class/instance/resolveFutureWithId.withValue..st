responding
resolveFutureWithId: id withValue: response
	[ [ response isError
		ifTrue:
			[ "Here we try to set back a signal context to the materialized exception.
				This will allow TaskIt to #freeze this materialized exception (if no signal context, an error is raised, see MAP-1247)"
			[ response signal ]
				on: Error
				do: [ :error | (futures at: id) deployFailure: error ] ]
		ifFalse: [ (futures at: id) deploySuccess: response ] ]
		on: Error
		do: [ :err | 
			MSUtils logError: err messageText.
			futures at: id ifPresent: [ :f | f deployFailure: err ].
			Smalltalk
				at: #SnapDump
				ifPresent: [ :cls | cls handleException: err ] ] ] fork