accessing
handlerSendingTo: sendingQueue receivingFrom: receivingQueue
	^ MSQueueHandler new
		sender: (MSQueueDispatcher new
			host: hostname;
			virtualHost: virtualHost;
         username: username password: password;
         bindingKey: sendingQueue;
			startTimer )
		receiver: (MSQueueConsumer new
   			host: hostname;
			virtualHost: virtualHost;
   			username: username password: password;
   			bindingKey: receivingQueue;
			beResponseHandler);
		yourself