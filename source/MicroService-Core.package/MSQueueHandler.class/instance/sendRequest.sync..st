accessing
sendRequest: aRequest sync: aBoolean
	MMUtils logDebug: 'sending request ', aRequest asString, ' with mode ', aBoolean asString.
	^  sender sendRequest: aRequest sync: aBoolean