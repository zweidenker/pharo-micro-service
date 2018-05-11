accessing
startReceiver
	(MSPortChecker new host: hostname; port: 61613) waitForOpenPort.
	receiverProcess ifNotNil: [ 
		MSUtils logInfo: 'consumer process already started...'.
		^ self ].
	receiverProcess := [ 
		[ 
			MSUtils logInfo: 'Starting run loop'.
			self runLoop ]
		on: Error 
		do: [ :error |
			error pass.
			MSUtils logError: error.
			Smalltalk 
				at: #ExceptionReporter
				ifPresent: [ :reporter | reporter handleException: error ] ] ] forkNamed: 'queue consumer for: ', self receiverQueue asString.