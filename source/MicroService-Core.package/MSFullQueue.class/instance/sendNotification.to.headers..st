as yet unclassified
sendNotification: notification to: queue headers: aDictionary
	self withSenderDo: [:client |
		self
			sendJSONObject: notification
			to: queue
			headers:
				(aDictionary copyWith: 'notificationClass' -> notification class name)
			client: client ]