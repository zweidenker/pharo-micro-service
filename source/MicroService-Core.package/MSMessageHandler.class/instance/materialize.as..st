misc
materialize: aString as: aClass
	^ (NeoJSONReader on: aString readStream)
		mapClass: NeoJSONObject;
		propertyNamesAsSymbols: true;
		nextAs: aClass
	