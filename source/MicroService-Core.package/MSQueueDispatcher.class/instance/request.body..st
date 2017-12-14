accessing
request: aRequestType body: aString

	| response |
	response := [ (MSRequest withLabel: aRequestType)
		body: aString;
		execute ]
		on: Error 
		do: [ :err | MSErrorResponse error: err  ].
	^ NeoJSONWriter toStringPretty: response