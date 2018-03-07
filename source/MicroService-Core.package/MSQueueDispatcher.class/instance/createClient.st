accessing
createClient
	| c |
	c := super createClient.
	c heartbeat: (c timeout * 1000 * 4) + 1.
	self startHeartbeatTimer.
	^ c