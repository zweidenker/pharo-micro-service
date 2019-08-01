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
			MSUtils logError: error.
			Smalltalk 
				at: #SnapDump
				ifPresent: [ :reporter | reporter handleException: error ].
			"we want to let the exception pass so that users can be notified that the receiving loop stopped"
			error pass.	
			 ] ] forkNamed: 'queue consumer for: ', self receiverQueue asString.