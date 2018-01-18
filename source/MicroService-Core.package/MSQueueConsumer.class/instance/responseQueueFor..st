accessing
responseQueueFor: message
	^ message 
		headerAt: #'reply-to'
		ifAbsent: [  
			(message headerAt: 'response-queue') ]
	