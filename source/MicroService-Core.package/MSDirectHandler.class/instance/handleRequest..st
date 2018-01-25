as yet unclassified
handleRequest: aRequest
	| response |
	response := aRequest directCall: delegate.
	^ NeoJSONReader 
		fromString:  (NeoJSONWriter toString: response)
		as: response class