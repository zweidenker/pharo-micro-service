accessing
sendRequest: request to: queueName headers: aDictionary
	self
		sendJSONObject: request
		to: queueName
		headers:
			(aDictionary
				copyWithAll:
					{
					('auto-delete' -> 'true'). 
					('requestClass' -> request class name).
					('reply-queue' -> receiverQueue)} asDictionary)