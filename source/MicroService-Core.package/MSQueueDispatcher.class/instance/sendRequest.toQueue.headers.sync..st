accessing
sendRequest: request toQueue: queueName headers: aDictionary sync: aBoolean
	| c message msg correlationId  |
	semaphore critical: [  
	c := self client.

	c isConnected ifFalse: [ 
		MSUtils logInfo: 'connection is not connected. connecting...'.
		[ c open ]
		on: StampError do: [ :err | Transcript show: 'got stamp error while opening connection' "ignore" ] ].
	message := c newSendFrameTo: queueName.

	aBoolean ifFalse: [  
		headers keysAndValuesDo: [ :name :value |
			message headerAt: name put: value ]] .

	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].

	message
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: request).
		

	aBoolean 
		ifTrue: [ message replyTo: '/temp-queue/', UUID new asString36 ]
		ifFalse: [
			message 
				headerAt: 'reply-queue' put: self replyQueue ].
	MSUtils logDebug: 'sending message: ', message asString.
	c write: message.
	MSUtils logDebug: 'sent message: ', message asString.
	
	^ aBoolean 
		ifTrue: [ 
			[ msg := c readMessage ]
				on: StampError 
				do: [:err | Transcript show: 'got stamp error while reading sync message' ."ignore once and try again " msg := c readMessage ].
			MSUtils logInfo: 'got sync response: ', msg asString.
			MSUtils logInfo: 'closing connection'.
			c close.
			(self materializeResponseFrom: msg) ]
		ifFalse: [
			c close.
			MSQueueFuture new
				queueName: replyQueue;
				correlationId: correlationId ] ]