sending
sendRequest: aRequest sync: aBoolean
	| result |
	MMUtils logDebug: 'sending queue request ', aRequest asString, ' with mode ', aBoolean asString.
	^ aBoolean  
		ifTrue: [ 
			sender sendRequest: aRequest headers: { } asDictionary sync: aBoolean ]
		ifFalse: [ | correlationId future |
			correlationId := UUID new asString36.
			future := MSQueueFuture new
				queueName: sender replyQueue;
				correlationId: correlationId.
			MSUtils logInfo: 'adding future with id ', result id asString.
			self futureAt: correlationId put: future. 
			sender sendRequest: aRequest headers: {'correlation-id' -> correlationId } asDictionary sync: aBoolean.
			future ]