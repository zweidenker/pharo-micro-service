accessing
startTimer
	(MSPortChecker new host: self host; port: 61613) waitForOpenPort.
	self startHeartbeatTimer 
	