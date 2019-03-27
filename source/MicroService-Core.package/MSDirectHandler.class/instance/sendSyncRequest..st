accessing
sendSyncRequest: aRequest
	| response |
	response := self handleRequest: aRequest.
	^ response