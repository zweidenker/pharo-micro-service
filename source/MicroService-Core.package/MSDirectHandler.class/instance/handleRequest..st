public
handleRequest: aRequest
	| response result |

	[[ response := aRequest directCall: delegate.
		"normal response. If not a subclass of MSResponse signal error. Most probably a missing implementation"
		(response isKindOf: MSResponse)
			ifFalse: [ MSMissingResponse signal: response asString  ] ]
			on: MSError
			do: [ :error | 
				"a deliberately signaled MSError subclass should be normally communicated to the senver"
				response := self handleError: error ]]
			on: Error
			do: [ :error | error pass].
	result := (NeoJSONReader on: (NeoJSONWriter toString: response) readStream)
		propertyNamesAsSymbols: true;
		nextAs: response class.
	result isError ifTrue: [ 
		result signal ].
	^ result