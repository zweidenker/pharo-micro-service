accessing
sendAsyncRequest: aRequest
	| f value |
	f := MSLocalFuture new.
	MMUtils logDebug: 'sending async future ' , aRequest asString .
	value := self handleRequest: aRequest.
	f 
		do: [ 
			service
				resolveFuture: f
				withValue: value ];
		yourself.
	^ f