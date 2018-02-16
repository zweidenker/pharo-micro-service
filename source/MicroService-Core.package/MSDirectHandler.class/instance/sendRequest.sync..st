accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ | response |
			response := self handleRequest: aRequest.
			response isError ifTrue: [ 
				response signal ].
			response]
		ifFalse: [ | f |
			f := MSLocalFuture new.
			MMUtils logDebug: 'sending future ' , aRequest asString , ', mode ' , aBoolean asString.
			f
				do: [ 
					
					service
						resolveFuture: f
						withValue: (self handleRequest: aRequest) ];
				yourself ]