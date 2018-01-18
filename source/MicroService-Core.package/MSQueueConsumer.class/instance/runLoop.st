accessing
runLoop

	self client 
		open; 
		subscribeTo: bindingKey;
		runWith: [ :message | self handleMessage: message ]