accessing
sendResponse: response headers: aDictionary to: queue
	| message |
	message := self client newSendFrameTo: queue.
	message headerAt: 'auto-delete' put: 'true'. 
	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].
	message 
		"persistent: true;"
		contentType: 'application/json; charset=utf-8';
		headerAt: 'responseClass' put: response class name;
		body: (self serialize: response).
	MSUtils logDebug: 'sending frame: ', message asString.
	self client write: message.
