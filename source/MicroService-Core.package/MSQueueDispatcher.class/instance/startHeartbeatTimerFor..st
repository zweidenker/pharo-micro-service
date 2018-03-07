accessing
startHeartbeatTimerFor: aClient
	heartbeatProcess := [ | time |
		aClient isConnected ifFalse: [ aClient open ].
		time := aClient heartbeat / 2.
		[  
			time milliSeconds wait.
			semaphore critical: [ 
				"client readHeartbeatMessage 
					ifTrue: [ self client writeHeartbeat  ]
					ifFalse: [" aClient writeHeartbeatIfNeeded.  "] "
				Transcript show: 'heartbeat sent';cr.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'