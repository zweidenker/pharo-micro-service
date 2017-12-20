as yet unclassified
materializeResponseFrom: aMessage
	^ NeoJSONReader 
		fromString: aMessage body
		as: (aMessage headerAt: 'responseClass') asClass