accessing
dispatchRequest: aRequest
	| response |
	aRequest setupHTTPClient: self.
	response := self client execute.
	
	self halt.