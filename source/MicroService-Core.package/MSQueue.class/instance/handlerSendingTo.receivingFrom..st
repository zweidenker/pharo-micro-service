accessing
handlerSendingTo: sendingQueue receivingFrom: receivingQueue
	^ MSQueueHandler new
		sender: (MSQueueDispatcher new
			 host: hostname;
          username: username password: password;
          bindingKey: sendingQueue )
		receiver: (MSQueueConsumer new
   			host: hostname;
   			username: username password: password;
   			bindingKey: receivingQueue;
			beResponseHandler;
			headerAt: 'exclusive' put: 'true';
			start);
		yourself