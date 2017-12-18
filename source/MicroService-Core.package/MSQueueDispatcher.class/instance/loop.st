accessing
loop

	self client runWith: [ :message | 
		self 
			send: (self request: (message headerAt: 'request') body: message body) 
			to: (message headerAt: 'response-queue') ]