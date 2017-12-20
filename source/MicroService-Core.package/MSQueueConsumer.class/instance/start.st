accessing
start
	self ensureQueueIsPresent.
	process := [ self runLoop ] fork