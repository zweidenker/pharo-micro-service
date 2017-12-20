accessing
materializeRequestFrom: aMessage
	^ NeoJSONReader 
		fromString: aMessage body
		as: (aMessage headerAt: 'requestClass') asClass