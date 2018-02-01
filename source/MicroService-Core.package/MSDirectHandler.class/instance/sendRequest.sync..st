accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ self handleRequest: aRequest  ]
		ifFalse: [ | f |
			f := MSLocalFuture new.
			MMUtils logDebug: 'sending future ' , aRequest asString , ', mode ' , aBoolean asString.
			f
				do: [ (Delay forMilliseconds: 500) wait.
					service
						resolveFuture: f
						withValue: (self handleRequest: aRequest) ];
				yourself ]