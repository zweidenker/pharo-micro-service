accessing
rpcLoop
	self client 
		open; 
		subscribeTo: bindingKey;
		runWith: [ :message | | time |
			MSUtils logInfo: 'got request: ', message asString.
			time := [ 
				self 
					send: (self request: (message headerAt: 'request') body: message body) 
					to: message replyTo ] timeToRun.
			MSUtils logDebug: 'time = ', time asString ]
	
