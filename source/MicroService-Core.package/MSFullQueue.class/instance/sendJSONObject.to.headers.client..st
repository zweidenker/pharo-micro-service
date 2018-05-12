as yet unclassified
sendJSONObject: object to: queue headers: aDictionary client: client
	| message |
	message := client newSendFrameTo: queue.
	
	aDictionary keysAndValuesDo: [ :key :value |
		 message headerAt: key put: value ].
	
	message 
		contentType: 'application/json; charset=utf-8';
		body: (self serialize: object).
		
	MSUtils logDebug: 'sending frame: ', message asString.
	client write: message 