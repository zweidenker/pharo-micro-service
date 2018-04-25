accessing
startHeartbeatTimer
	"MSUtils logInfo: 'starting heartbeat timer'.
	heartbeatProcess ifNotNil: [ 
		MSUtils logInfo: 'heartbeat timer already started...'.
		^ self  ].
	heartbeatProcess := [ | time |
		self client isConnected ifFalse: [ self client open ].
		time := self client heartbeat.
		[  
			time milliSeconds wait.
			semaphore critical: [ 
				 self client writeHeartbeatIfNeeded. 
				MSUtils logInfo: 'heartbeat sent'.
			]
		 ] repeat ] forkNamed: 'queue dispatcher heartbeat'"