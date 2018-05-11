instance creation
newQueue
	^ MSFullQueue new
		hostname: hostname;
		username: username;
		password: password;
		virtualHost: virtualHost 