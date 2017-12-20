message interception
sendJSON: json to: queue
	| message |
	message := self client newSendFrameTo: queue.
	message 
		"persistent: true;"
		contentType: 'application/json; charset=utf-8';
		body: json.
	MSUtils logDebug: 'sending frame: ', message asString.
	self client write: message.
