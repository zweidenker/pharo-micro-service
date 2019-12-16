accessing
sendAsyncRequest: aRequest
	MMUtils logDebug: 'sending async request ' , aRequest asString .
	 ^  [ | response |
		response := self handleRequest: aRequest.
		response isError ifTrue: [
			Smalltalk  
					at: #SnapDump
					ifPresent: [ :reporter | reporter handleException: response ]. 
			response signal ].
		response ] future