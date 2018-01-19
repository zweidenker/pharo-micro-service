as yet unclassified
beResponseHandler
	self beResponseHandlerFor: [ :response :headers | | id |
		id := headers at: 'correlation-id'. 
		MSUtils logDebug: 'received response with correlation-id ', id asString.
		service responseReceived: response correlationId: id ]