as yet unclassified
beResponseHandlerFor: aBlock
	self messageHandler: (MSResponseHandler new 
		delegate: aBlock)