accessing
createClient
	^ StampClient new
		host: self host;
	 	login: username;
	 	passcode: password;
		yourself