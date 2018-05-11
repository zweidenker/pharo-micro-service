accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean
		ifTrue: [ | response |
			response := self handleRequest: aRequest.
			response isError ifTrue: [ 
				response signal ].
			response]
		ifFalse: [ | f value |
			f := MSLocalFuture new.
			MMUtils logDebug: 'sending future ' , aRequest asString , ', mode ' , aBoolean asString.
			value := self handleRequest: aRequest.
			f
				do: [ 
					
					service
						resolveFuture: f
						withValue: value ];
				yourself ]