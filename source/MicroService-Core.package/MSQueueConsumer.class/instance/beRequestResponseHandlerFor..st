as yet unclassified
beRequestResponseHandlerFor: aBlock
	self messageHandler: (MSRequestResponseHandler new 
		delegate: aBlock)