sending
sendRequest: aRequest sync: aBoolean
	| correlationId |
	MMUtils logDebug: 'sending queue request ', aRequest asString, ' with mode ', aBoolean asString.
	correlationId := UUID new asString36.
	^ aBoolean  
		ifTrue: [ | promise  |
			"sync calls are done async over rabbitmq but a blocking value call on the promise"
			MSUtils logInfo: 'preparing sync promise for id ', correlationId asString.
			promise := MSPromise new.
			self futureAt: correlationId put: promise. 
			promise asyncDo: [ 
				sender sendRequest: aRequest headers: { 'correlation-id' -> correlationId } asDictionary ].
			^ promise value ]
		ifFalse: [ | future |
			future := MSFuture new.
			MSUtils logInfo: 'adding future with id ', correlationId asString.
			self futureAt: correlationId put: future. 
			sender sendRequest: aRequest headers: {'correlation-id' -> correlationId } asDictionary.
			future ]