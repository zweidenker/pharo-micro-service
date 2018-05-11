as yet unclassified
requestResponseHandlerForService: service
	messageHandler := MSRequestResponseHandler new 
		queue: self;
		delegate: [ :request | request directCall: service ].
	