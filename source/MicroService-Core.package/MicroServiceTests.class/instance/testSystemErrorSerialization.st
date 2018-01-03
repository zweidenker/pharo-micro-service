tests
testSystemErrorSerialization
	| json thrown | 
	
	json := [ 1 / 0  ]
		on: Error 
		do: [ :error | NeoJSONWriter toString: (MSSystemError fromError: error) ].
	
	thrown := false.
	[ (NeoJSONReader fromString: json as: MSSystemError) signal ]
		on: ZeroDivide
		do: [ :error | thrown := true ].
		
	self assert: true