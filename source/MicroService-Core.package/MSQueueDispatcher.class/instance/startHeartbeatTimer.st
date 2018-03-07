accessing
startHeartbeatTimer
	MSUtils logInfo: 'starting heartbeat timer'.
	heartbeatProcess ifNotNil: [ 
		MSUtils logInfo: 'heartbeat timer already started...'.
		^ self  ].
	heartbeatProcess := [ | time |
		self client isConnected ifFalse: [ self client open ].
		time := self client heartbeat / 2.
		[  
			time milliSeconds wait.
			semaphore critical: [ 
				"client readHeartbeatMessage 
					ifTrue: [ self client writeHeartbeat  ]
					ifFalse: [" self client writeHeartbeatIfNeeded.  "] "
				MSUtils logInfo: 'heartbeat sent'.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'