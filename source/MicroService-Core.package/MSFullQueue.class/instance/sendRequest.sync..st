accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ self sendSyncRequest: aRequest ]
		ifFalse: [ self sendAsyncRequest: aRequest ]