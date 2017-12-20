accessing
sendRequest: request toQueue: queueName headers: aDictionary sync: aBoolean
	| c message msg correlationId returnQueue |
	self client isConnected ifFalse: [ self client open ].
	c := self client.
	message := c newSendFrameTo: queueName.
	message
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: request).
		
	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].

	aBoolean 
		ifTrue: [ 
			returnQueue := '/temp-queue/', 100000 atRandom asString.
			message replyTo: returnQueue ]
		ifFalse: [
			correlationId := self createCorrelationId. 
			returnQueue := '/queue/', 100000 atRandom asString.
			message 
				headerAt: 'correlation-id' put: correlationId;
				headerAt: 'return-queue' put: returnQueue ].

	c write: message.
	
	^ aBoolean 
		ifTrue: [ 
			msg := c readMessage.
			c close.
			(self materializeResponseFrom: msg) ]
		ifFalse: [
			c close.
			MSFutureResult new
				service: self; 
				queueName: returnQueue;
				correlationId: correlationId ]