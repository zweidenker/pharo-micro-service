accessing
responseQueueFor: message
	^ rpcMode 
		ifTrue: [ message replyTo ]
		ifFalse: [ (message headerAt: 'response-queue') ]
	