as yet unclassified
sendJSONObject: object to: queue headers: aDictionary
	| message c |
	senderSemaphore critical: [  
		c := self senderClient.

		c isConnected ifFalse: [ 
			MSUtils logInfo: 'connection is not connected. connecting...'.
			[ c open ]
				on: StampError 
				do: [ :err | Transcript show: 'got stamp error while opening connection' "ignore" ] ].

		message := c newSendFrameTo: queue.
		aDictionary keysAndValuesDo: [ :key :value |
			 message headerAt: key put: value ].
		message 
			contentType: 'application/json; charset=utf-8';
			body: (self serialize: object).
		
		MSUtils logDebug: 'sending frame: ', message asString.
		c write: message ]