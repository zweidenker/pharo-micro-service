accessing
host
	^ host ifNil: [ 
		host := NetNameResolver localHostName ]