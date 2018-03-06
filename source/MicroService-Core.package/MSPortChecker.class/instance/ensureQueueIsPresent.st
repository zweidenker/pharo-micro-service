accessing
ensureQueueIsPresent
	MSUtils logInfo: 'Waiting for host ', self host asString.
	self waitForHostNamed: self host.
	MSUtils logInfo: 'Checking available port'.
	self 
		waitForOpenPort: self port
		on: self host
		