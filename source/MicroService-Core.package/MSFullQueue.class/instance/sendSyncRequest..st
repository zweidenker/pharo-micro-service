as yet unclassified
sendSyncRequest: aRequest
	| correlationId promise |
	MMUtils logDebug: 'sending sync queue request ', aRequest asString.
	correlationId := self createCorrelationId.
	
	"sync calls are done async over rabbitmq but a blocking value call on the promise"
	MSUtils logInfo: 'preparing sync promise for id ', correlationId asString.
	promise := MSPromise new.
	messageHandler futureAt: correlationId put: promise. 
	promise asyncDo: [ 
		self sendRequest: aRequest headers: { 'correlation-id' -> correlationId } asDictionary ].
	^ promise value