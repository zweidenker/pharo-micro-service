message interception
send: json to: queue
	| frame |
	frame := self client newSendFrameTo: queue.
	frame 
		"persistent: true;"
		contentType: 'application/json; charset=utf-8';
		body: json.
	MSUtils logDebug: 'sending frame: ', frame asString.
	self client write: frame.
