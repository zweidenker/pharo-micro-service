accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ aRequest directCall: delegate ]
		ifFalse: [ | f |
			f := MSLocalFuture new.
			service mobilityMap addFuture: f.
			MMUtils logDebug: 'sending future ' , aRequest asString , ', mode ' , aBoolean asString.
			f
				do: [ (Delay forMilliseconds: 500) wait.
					service
						resolveFuture: f
						withValue: (aRequest directCall: delegate) ];
				yourself ]