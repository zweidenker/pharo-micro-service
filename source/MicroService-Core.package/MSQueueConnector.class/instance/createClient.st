accessing
createClient
	^ StampClient new
		host: self host;
		virtualHost: self virtualHost;
		timeout: 10;
		login: username;
		passcode: password;
		debug: true.