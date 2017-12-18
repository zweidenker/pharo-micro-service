accessing
startRpcLoop
	self ensureQueueIsPresent.
	process := [ self rpcLoop ] fork