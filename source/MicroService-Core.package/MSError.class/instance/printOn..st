printing
printOn: aStream
	aStream 
		nextPutAll: self errorClassName asString;
		nextPutAll: ' >> ';
		nextPutAll: messageText asString