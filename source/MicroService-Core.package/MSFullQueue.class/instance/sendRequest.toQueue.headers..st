accessing
sendRequest: request toQueue: queueName headers: aDictionary
	
	self 
		sendJSONObject: request  
		headers:  (aDictionary copyWithAll: { 
			'requestClass' -> request class name.
			'reply-queue' -> receiverQueue } asDictionary) 
		to: queueName