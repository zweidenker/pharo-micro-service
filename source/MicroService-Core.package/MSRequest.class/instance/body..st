accessing
body: anObject
	self jsonBody: (NeoJSONReader fromString: anObject)