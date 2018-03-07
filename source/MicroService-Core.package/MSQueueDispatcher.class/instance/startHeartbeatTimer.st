accessing
startHeartbeatTimer
	heartbeatProcess := [ | time |
		self client isConnected ifFalse: [ client open ].
		time := client heartbeat / 2.
		[  
			time milliSeconds wait.
			semaphore critical: [ 
				"client readHeartbeatMessage 
					ifTrue: [ self client writeHeartbeat  ]
					ifFalse: [" self client writeHeartbeatIfNeeded.  "] "
				Transcript show: 'heartbeat sent';cr.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'