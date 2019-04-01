as yet unclassified
requestResponseHandlerForService: aService
	messageHandler := MSRequestResponseHandler new 
		queue: self;
		delegate: [ :request | 
			request directCall: aService ].
	