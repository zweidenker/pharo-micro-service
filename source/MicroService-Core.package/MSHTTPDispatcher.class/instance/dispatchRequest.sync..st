accessing
dispatchRequest: aRequest sync: aBoolean
	| response |
	aRequest setupHTTPClient: self.
	response := self client execute.
	
	self halt.