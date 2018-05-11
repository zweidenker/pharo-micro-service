accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ self sendSynchronousRequest: aRequest ]
		ifFalse: [ self sendAsyncRequest: aRequest ]