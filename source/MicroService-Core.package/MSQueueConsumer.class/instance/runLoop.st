accessing
runLoop
	| subscription |
	self client open.
	subscription := (self client newSubscriptionTo: bindingKey).
	self client write: (subscription subscribeFrame 
		headerAt: 'auto-delete' put: 'true';
		yourself).
	self client
		runWith: [ :message | self handleMessage: message ]