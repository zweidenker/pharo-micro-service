as yet unclassified
sendNotification: notification headers: aDictionary to: queue
	self 
		sendJSONObject: notification 
		headers: (aDictionary copyWith: ('notificationClass' -> notification class name))
		to: queue