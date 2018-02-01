accessing
runLoop
	| subscription |
	self client open.
	subscription := (self client newSubscriptionTo: bindingKey).
	self client write: (subscription subscribeFrame 
		headerAt: 'x-expires' put: '120000';
		yourself).
	self client
		runWith: [ :message | self handleMessage: message ]