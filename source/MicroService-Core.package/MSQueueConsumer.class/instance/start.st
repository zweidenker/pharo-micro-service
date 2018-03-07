accessing
start
	(MSPortChecker new host: self host; port: 61613) waitForOpenPort.
	process ifNotNil: [ 
		MSUtils logInfo: 'consumer process already started...'.
		^ self ].
	process := [ 
		[ 
			MSUtils logInfo: 'Starting run loop'.
			self runLoop ]
		on: Error 
		do: [ :error |
			MSUtils logError: error.
			debugMode ifTrue: [ error pass ].
			Smalltalk 
				at: #ExceptionReporter
				ifPresent: [ :reporter | reporter handleException: error ] ] ] forkNamed: 'queue consumer for: ', bindingKey asString.