as yet unclassified
handlerForQueue: aString
	^ MSQHandler new
		sender: self;
		queueName: aString