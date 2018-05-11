as yet unclassified
handleResponse: response headers: dict
	self 
		resolveFutureWithId: (dict at: 'correlation-id') 
		withValue: response