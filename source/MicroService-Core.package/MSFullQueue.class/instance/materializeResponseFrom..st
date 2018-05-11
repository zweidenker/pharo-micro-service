accessing
materializeResponseFrom: aMessage
	^ self 
		materialize: aMessage body 
		as: (aMessage headerAt: 'responseClass') asClass
	