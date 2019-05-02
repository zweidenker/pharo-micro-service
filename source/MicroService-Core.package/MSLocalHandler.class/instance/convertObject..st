public
convertObject: anObject
	"convert the object back and forth to be sure to have the same value as in 
	serialized/materialized environment"
	^ (NeoJSONReader on: (NeoJSONWriter toString: anObject) readStream)
		propertyNamesAsSymbols: true;
		nextAs: anObject class