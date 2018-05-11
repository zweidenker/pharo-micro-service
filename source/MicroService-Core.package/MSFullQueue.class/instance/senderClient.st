accessing
senderClient
	^ senderClient ifNil: [ 
		senderClient := self createClient ].
	