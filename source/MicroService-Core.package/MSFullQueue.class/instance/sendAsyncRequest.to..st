accessing
sendAsyncRequest: aRequest to: queue
	| correlationId future |
	MMUtils logDebug: 'sending async queue request ', aRequest asString.
	correlationId := self createCorrelationId.
	
	future := TKTFuture new.
	MSUtils logInfo: 'adding future with id ', correlationId asString.
	messageHandler futureAt: correlationId put: future. 
	self sendRequest: aRequest to: queue headers: {'correlation-id' -> correlationId } asDictionary.
	^ future 