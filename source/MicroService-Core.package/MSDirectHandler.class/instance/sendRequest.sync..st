accessing
sendRequest: aRequest sync: aBoolean
	| id |
	id := 1000000 atRandom asString.
	^ aBoolean 
		ifTrue: [ aRequest directCall: delegate ]
		ifFalse: [ 
			MSLocalFuture new 
				correlationId: id;
				do: [ (Delay forMilliseconds: 500) wait. service responseReceived: (aRequest directCall: delegate) correlationId: id ];
				yourself ]