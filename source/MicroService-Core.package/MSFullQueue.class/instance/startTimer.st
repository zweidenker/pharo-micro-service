accessing
startTimer
	(MSPortChecker new host: hostname; port: 61613) waitForOpenPort.
	self startHeartbeatTimer 
	