instance creation
fromError: anError
	^ self new 
		className: anError class name;
		messageText: anError messageText