public
convertResponse: response
	"convert the object back and forth to be sure to have the same value as in 
	serialized/materialized environment"
	^ (NeoJSONReader on: (NeoJSONWriter toString: response) readStream)
		propertyNamesAsSymbols: true;
		nextAs: response class