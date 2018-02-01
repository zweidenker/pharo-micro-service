accessing
ensureQueueIsPresent
	MSUtils logInfo: 'local hostname = ', NetNameResolver localHostName.
	MSUtils logInfo: 'local ip address = ', self localIPAddress.
	MSUtils logInfo: 'Resolving host ', host asString.
	self waitForHostNamed: host.
	MSUtils logInfo: 'Checking available port'.
	self waitForOpenPortOn: host