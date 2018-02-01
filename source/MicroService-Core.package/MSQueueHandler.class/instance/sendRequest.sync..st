sending
sendRequest: aRequest sync: aBoolean
	| result |
	MMUtils logDebug: 'sending queue request ', aRequest asString, ' with mode ', aBoolean asString.
	result := sender sendRequest: aRequest sync: aBoolean.
	aBoolean ifFalse: [ 
		self futureAt: result id put: result ].
	^ result