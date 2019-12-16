accessing
sendSyncRequest: aRequest
	MMUtils logDebug: 'sending sync request ' , aRequest asString .
	^ self handleRequestWithErrors: aRequest