accessing
responseQueueFor: message
	^ message 
		headerAt: #'reply-to'
		ifAbsent: [  
			(message headerAt: 'reply-queue') ]
	