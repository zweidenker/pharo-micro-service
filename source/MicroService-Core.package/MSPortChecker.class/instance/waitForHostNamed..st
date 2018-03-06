accessing
waitForHostNamed: aString
	| address |
	[ address := self resolveHostname: aString ] whileNil: [ 
		MSUtils logError: 'cannot resolve ', aString.
		"give DNS some time to fill"
		(Delay forSeconds: 1) wait ].
	MSUtils 
		logInfo: aString,' has address ', (NetNameResolver stringFromAddress:  address).
	^ address