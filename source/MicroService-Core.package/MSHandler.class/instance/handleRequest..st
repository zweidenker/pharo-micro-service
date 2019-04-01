accessing
handleRequest: request
	| response |
	[ response := self dispatchRequest: request. 
		(response isKindOf: MSResponse)
			ifFalse: [ MSMissingResponse signal: response asString  ] ]
			on: Error
			do: [ :error | response := self handleError: error ].
	^ response
