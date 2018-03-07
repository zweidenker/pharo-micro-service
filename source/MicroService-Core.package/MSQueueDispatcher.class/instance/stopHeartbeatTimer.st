accessing
stopHeartbeatTimer
	heartbeatProcess ifNotNil: [ 
		heartbeatProcess terminate.
		heartbeatProcess := nil ]