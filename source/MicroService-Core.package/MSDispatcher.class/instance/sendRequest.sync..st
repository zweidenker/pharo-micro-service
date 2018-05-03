accessing
sendRequest: aRequest sync: aBoolean
	^ self sendRequest: aRequest headers: { } asDictionary sync: aBoolean