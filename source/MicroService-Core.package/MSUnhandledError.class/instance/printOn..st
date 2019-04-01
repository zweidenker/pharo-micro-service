printing
printOn: aStream
	aStream 
		nextPutAll: errorClassName asString;
		nextPutAll: ' >> ';
		nextPutAll: messageText asString