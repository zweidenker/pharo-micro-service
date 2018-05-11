as yet unclassified
sendSynchronousRequest: aRequest
	^ sender sendSynchronousRequest: aRequest to: queueName