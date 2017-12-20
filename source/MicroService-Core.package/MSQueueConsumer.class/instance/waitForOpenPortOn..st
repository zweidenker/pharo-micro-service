accessing
waitForOpenPortOn: aString
	[ self pingHost: aString port: 61613 ] whileNil: [ 
		MSUtils logError: 'cannot connect to port 61613'.
		"wait for the host to appear"
		(Delay forSeconds: 1) wait ].
	MSUtils logInfo: 'Port 61613 is available'
