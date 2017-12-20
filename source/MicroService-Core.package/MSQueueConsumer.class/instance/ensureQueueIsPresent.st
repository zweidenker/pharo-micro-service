accessing
ensureQueueIsPresent
	MSUtils logInfo: 'Resolving host ', host asString.
	self waitForHostNamed: host.
	MSUtils logInfo: 'Checking available port'.
	self waitForOpenPortOn: host