as yet unclassified
sendSyncRequest: aRequest
	^ sender sendSynchronousRequest: aRequest to: queueName