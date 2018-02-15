public
handleRequest: aRequest
	| response |

	[ response := aRequest directCall: delegate.
		(response isKindOf: MSResponse)
			ifFalse: [ MSMissingResponse signal: response asString  ] ]
			on: Error
			do: [ :error | response := self handleError: error].
	^ NeoJSONReader 
		fromString:  (NeoJSONWriter toString: response)
		as: response class