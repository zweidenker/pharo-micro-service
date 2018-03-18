accessing
newConsumer
	^ MSQueueConsumer new
   			host: hostname;
			virtualHost: virtualHost;
   			username: username password: password;
			yourself