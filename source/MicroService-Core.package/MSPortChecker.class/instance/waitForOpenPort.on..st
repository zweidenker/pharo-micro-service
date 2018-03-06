as yet unclassified
waitForOpenPort: port on: aHost
	[ self pingHost: aHost port: port ] whileNil: [ 
		MSUtils logError: 'cannot connect to port ', port asString.
		"wait for the host to appear"
		(Delay forSeconds: 1) wait ].
	MSUtils logInfo: 'Port ', port asString,' is available'
