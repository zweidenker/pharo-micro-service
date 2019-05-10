responding
resolveFutureWithId: id withValue: response 
	[ [ response isError 
			ifTrue: [ 
				"Here we try to set back a signal context to the materialized exception.
				This will allow TaskIt to #freeze this materialized exception (if no signal context, an error is raised, see MAP-1247). 
				Note that I am not sure about consequences of such exception manipulation, I am playing around.
				
				I am not sure neither that pleasing TaskIt is necessarly the way to go: 
				maybe #deployFailures: is only to be used internally by TaskIt, 
				and we should at the end only define 'block future' and let TaskIt #deployFailure when an exception is raised ...  
				But still, the current change could fix the issue easily at first"
				(futures at: id) deployFailure: (response searchFrom: thisContext; yourself) ] 
			ifFalse: [ (futures at: id) deploySuccess: response ] ]
		on: Error 
		do: [ :err |
			MSUtils logError: err messageText.
			futures at: id ifPresent: [:f | f deployFailure: err ].
			Smalltalk
				at: #ExceptionReporter
				ifPresent: [ :cls | cls handleException: err ] ] ] fork