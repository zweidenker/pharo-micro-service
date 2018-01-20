accessing
resolve: anObject 
	MSUtils logDebug: 'resolving future ', self asString.
	value := anObject.
	state := #resolved.
	successHandler do: [ :each |
		MSUtils logDebug: '[', self asString, '] trigger handler ', each asString.
		each value: anObject ]