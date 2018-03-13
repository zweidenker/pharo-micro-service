misc
materialize: aString as: aClass
	^ (NeoJSONReader on: aString readStream)
		propertyNamesAsSymbols: true;
		nextAs: aClass
	