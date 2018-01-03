tests
testErrorSerialization
	| json thrown | 
	
	json := [ MSError signal: 'test'  ]
		on: MSError 
		do: [ :error | NeoJSONWriter toString: error ].
	
	thrown := false.
	[ (NeoJSONReader fromString: json as: MSError) signal ]
		on: MSError
		do: [ :error | thrown := true ].
		
	self assert: true