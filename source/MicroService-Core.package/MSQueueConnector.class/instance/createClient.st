accessing
createClient
	^ StampClient new
		host: self host;
		virtualHost: self virtualHost;
		timeout: 15;
		login: username;
		passcode: password;
		debug: true.