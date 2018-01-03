public
handleRequest: aRequest
	| response |
	response := aRequest directCall: self service.
	^ (response isKindOf: MSResponse)
		ifTrue: [ ^ response ] 
		ifFalse: [ DBBrokerMissingResponse signal: response asString  ]