accessing
startHeartbeatTimerFor: aClient
	MSUtils logInfo: 'starting heartbeat timer'.
	heartbeatProcess := [ | time |
		aClient isConnected ifFalse: [ aClient open ].
		time := aClient heartbeat / 2.
		[  
			time milliSeconds wait.
			semaphore critical: [ 
				"client readHeartbeatMessage 
					ifTrue: [ self client writeHeartbeat  ]
					ifFalse: [" aClient writeHeartbeatIfNeeded.  "] "
				MSUtils logInfo: 'heartbeat sent'.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'