accessing
sendAsyncRequest: aRequest
	 ^  [ | response |
		response := self handleRequest: aRequest.
		response isError ifTrue: [
			Smalltalk  
					at: #SnapDump
					ifPresent: [ :reporter | reporter handleException: response ]. 
			response signal ].
		response ] future
	
	
	