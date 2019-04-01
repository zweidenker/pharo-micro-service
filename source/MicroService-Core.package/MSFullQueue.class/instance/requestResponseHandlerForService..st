as yet unclassified
requestResponseHandlerForService: serviceOrClass
	messageHandler := MSRequestResponseHandler new 
		queue: self;
		delegate: [ :request | 
	self flag: #todaysRefactoring.
			"enable the setting of a service class instead of an instance
			to be able to change all services to classes"
			request directCall: (serviceOrClass class isMeta
				ifTrue: [ serviceOrClass new ]
				ifFalse: [ serviceOrClass ]) ].
	