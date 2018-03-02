public
handleRequest: aRequest
	| response |

	[ response := aRequest directCall: delegate.
		(response isKindOf: MSResponse)
			ifFalse: [ MSMissingResponse signal: response asString  ] ]
			on: Error
			do: [ :error | response := self handleError: error].
	^ (NeoJSONReader on: (NeoJSONWriter toString: response) readStream)
		mapClass: NeoJSONObject;
		propertyNamesAsSymbols: true;
		nextAs: response class