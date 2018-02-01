accessing
sendRequest: request toQueue: queueName headers: aDictionary sync: aBoolean
	| c message msg correlationId  |
	semaphore critical: [  
	self client isConnected ifFalse: [ self client open ].
	c := self client.
	message := c newSendFrameTo: queueName.
	message
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: request).
		
	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].

	correlationId := self createCorrelationId.
	aBoolean 
		ifTrue: [ message replyTo: '/temp-queue/', 100000 atRandom asString ]
		ifFalse: [
			message 
				headerAt: 'correlation-id' put:  correlationId;
				headerAt: 'reply-queue' put: self replyQueue ].

	c write: message.
	
	^ aBoolean 
		ifTrue: [ 
			msg := c readMessage.
			(self materializeResponseFrom: msg) ]
		ifFalse: [
			MSQueueFuture new
				queueName: replyQueue;
				correlationId: correlationId ] ]