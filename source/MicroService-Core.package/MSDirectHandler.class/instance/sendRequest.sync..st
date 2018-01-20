accessing
sendRequest: aRequest sync: aBoolean
	| id |
	id := 1000000 atRandom asString.
	^ aBoolean 
		ifTrue: [ aRequest directCall: delegate ]
		ifFalse: [ | f |
			f := MSLocalFuture new 
				correlationId: id.
			service mobilityMap addFuture: f.
			MMUtils logDebug: 'sending future ', aRequest asString, ' with correlation id ', id asString, ', mode ', aBoolean asString.
			f do: [ (Delay forMilliseconds: 500) wait. service responseReceived: (aRequest directCall: delegate) correlationId: id ];
				yourself ]