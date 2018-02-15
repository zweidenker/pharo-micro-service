accessing
resolveError: anObject 
	MSUtils logDebug: 'future is error ', self asString.
	state := #error.

	failHandler do: [ :each |
		MSUtils logDebug: '[', self asString, '] trigger error handler ', each asString.
		each value: anObject ]