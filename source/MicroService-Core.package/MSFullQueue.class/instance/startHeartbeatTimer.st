accessing
startHeartbeatTimer
	MSUtils logInfo: 'starting heartbeat timer'.
	heartbeatProcess ifNotNil: [ 
		MSUtils logInfo: 'heartbeat timer already started...'.
		^ self  ].
	heartbeatProcess := [ | time |
		self senderClient isConnected ifFalse: [ self senderClient open ].
		time := self senderClient heartbeat.
		[  
			time milliSeconds wait.
			senderSemaphore  critical: [ 
				 self senderClient writeHeartbeatIfNeeded. 
				MSUtils logInfo: 'heartbeat sent'.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'