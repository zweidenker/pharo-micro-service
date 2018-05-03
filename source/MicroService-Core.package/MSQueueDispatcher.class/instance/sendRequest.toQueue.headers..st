accessing
sendRequest: request toQueue: queueName headers: aDictionary
	| c message  |
	semaphore critical: [  
		c := self client.

		c isConnected ifFalse: [ 
			MSUtils logInfo: 'connection is not connected. connecting...'.
			[ c open ]
			on: StampError do: [ :err | Transcript show: 'got stamp error while opening connection' "ignore" ] ].
		message := c newSendFrameTo: queueName.

		headers keysAndValuesDo: [ :name :value |
			message headerAt: name put: value ].

		aDictionary keysAndValuesDo: [ :key :value |
			message headerAt: key put: value ].

		message
			contentType: 'application/json; charset=utf-8';
			body: (self serialize: request).	
	
		message headerAt: 'reply-queue' put: self replyQueue.
	
		c write: message.
		MSUtils logDebug: 'sent message: ', message asString.
	
		"c close "]