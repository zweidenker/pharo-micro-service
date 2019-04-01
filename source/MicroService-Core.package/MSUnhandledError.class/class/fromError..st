accessing
fromError: error
	^ self new 
		errorClassName: error class name;
		messageText: error description