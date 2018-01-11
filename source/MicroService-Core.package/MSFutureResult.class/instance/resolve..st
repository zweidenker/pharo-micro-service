accessing
resolve: anObject 
	value := anObject.
	state := #resolved.
	successHandler value: anObject 