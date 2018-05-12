accessing
sendResponse: response to: queue headers: aDictionary
		| c message |
	c := self receiverClient.
	message := c newSendFrameTo: queue.
	message headerAt: 'responseClass' put: response class name.
	aDictionary keysAndValuesDo: [ :key :value |
	message headerAt: key put: value ].
	message 
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: response).
		
	MSUtils logDebug: 'sending response frame: ', message asString.
	c write: message