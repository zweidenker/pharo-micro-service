instance creation
resolveResult: aFutureResult 
	^ [ (self client 
		subscribeTo: '/queue/', aFutureResult queueName;
		readMessage) body ]
		on: Error 
		do: [ :err | ^ aFutureResult  ]