printing
printOn: aStream
	aStream 
		nextPutAll: errorClassName asString;
		nextPutAll: ' >> ';
		nextPutAll: description asString