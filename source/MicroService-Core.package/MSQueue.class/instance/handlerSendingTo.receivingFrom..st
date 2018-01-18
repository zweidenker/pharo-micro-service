accessing
handlerSendingTo: sendingQueue receivingFrom: receivingQueue
	| handler |
	handler := MSQueueHandler new
		sender: (MSQueueDispatcher new
			 host: hostname;
          username: username password: password;
          bindingKey: sendingQueue );
		receiver: (MSQueueConsumer new
   			host: hostname;
   			username: username password: password;
   			bindingKey: receivingQueue;
			beResponseHandler;
			start)