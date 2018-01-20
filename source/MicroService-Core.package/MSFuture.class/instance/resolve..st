accessing
resolve: anObject 
	MSUtils logDebug: 'resolving future ', self asString.
	value := anObject.
	state := #resolved.
	successHandler do: [ :each |
		each value: anObject ]