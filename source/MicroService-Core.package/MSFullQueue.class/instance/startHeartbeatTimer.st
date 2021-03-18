accessing
startHeartbeatTimer
	MSUtils logInfo: 'starting heartbeat timer'.
	heartbeatProcess ifNotNil: [ 
		MSUtils logInfo: 'heartbeat timer already started...'.
		heartbeatProcess terminate  ].
	heartbeatProcess := [
		self senderClient isConnected ifFalse: [ 
			MSUtils logInfo: 'opening sending connection to queue'.
			self senderClient open ].
		[  
			5 seconds wait.
			senderSemaphore  critical: [ 
				MSUtils logInfo: 'trigger heartbeat send'.
				self senderClient writeHeartbeatIfNeeded ]
		 ] repeat 
	] forkNamed: 'queue dispatcher heartbeat'