accessing
sendAsyncRequest: aRequest
	 ^ self workerPool future: [ self handleRequest: aRequest. ]
	