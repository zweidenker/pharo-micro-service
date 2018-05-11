accessing
sendRequest: request to: queueName headers: aDictionary
	self
		sendJSONObject: request
		to: queueName
		headers:
			(aDictionary
				copyWithAll:
					{('requestClass' -> request class name).
					('reply-queue' -> receiverQueue)} asDictionary)