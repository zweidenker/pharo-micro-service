accessing
sendRequest: request toQueue: queueName headers: aDictionary sync: aBoolean
	| c message msg correlationId  |
	semaphore critical: [  
	self client isConnected ifFalse: [ self client open ].
	c := self client.
	message := c newSendFrameTo: queueName.

	aBoolean ifFalse: [  
		headers keysAndValuesDo: [ :name :value |
			message headerAt: name put: value ]] .

	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].

	message
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: request).
		

	correlationId := self createCorrelationId.
	aBoolean 
		ifTrue: [ message replyTo: '/temp-queue/', UUID new asString36 ]
		ifFalse: [
			message 
				headerAt: 'correlation-id' put:  correlationId;
				headerAt: 'reply-queue' put: self replyQueue ].
	MSUtils logDebug: 'sending message: ', message asString.
	c write: message.
	MSUtils logDebug: 'sent message: ', message asString.
	
	^ aBoolean 
		ifTrue: [ 
			msg := c readMessage.
			(self materializeResponseFrom: msg) ]
		ifFalse: [
			MSQueueFuture new
				queueName: replyQueue;
				correlationId: correlationId ] ]