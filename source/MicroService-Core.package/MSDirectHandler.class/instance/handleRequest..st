public
handleRequest: aRequest
	| response result |

	[ response := aRequest directCall: delegate.
	"normal response. If not a subclass of MSResponse signal error. Most probably a missing implementation"
	(response isKindOf: MSResponse)
		ifFalse: [ MSMissingResponse signal: response asString  ] ]
		on: Error
		do: [ :error | 
			response := self handleError: error ].
			
	result := (NeoJSONReader on: (NeoJSONWriter toString: response) readStream)
		propertyNamesAsSymbols: true;
		nextAs: response class.
	^ result