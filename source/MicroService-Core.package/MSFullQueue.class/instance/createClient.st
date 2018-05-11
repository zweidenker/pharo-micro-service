accessing
createClient
	^ StampClient new
		host: hostname;
		virtualHost: self virtualHost;
		timeout: 15;
		login: username;
		passcode: password;
		debug: true.