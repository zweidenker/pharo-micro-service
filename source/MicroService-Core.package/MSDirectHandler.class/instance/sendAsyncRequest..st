accessing
sendAsyncRequest: aRequest
	MMUtils logDebug: 'sending async future ' , aRequest asString .
	^ [ self handleRequest: aRequest. ] msFutureWithDelay: 100 milliSeconds.

	