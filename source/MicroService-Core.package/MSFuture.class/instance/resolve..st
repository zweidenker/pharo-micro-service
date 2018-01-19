accessing
resolve: anObject 
	value := anObject.
	state := #resolved.
	successHandler do: [ :each |
		each value: anObject ]