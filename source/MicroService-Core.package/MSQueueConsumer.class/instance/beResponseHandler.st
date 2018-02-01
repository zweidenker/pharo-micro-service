as yet unclassified
beResponseHandler
	self
		beResponseHandlerFor: [ :response :headers | 
			| id |
			id := headers at: 'correlation-id'.
			MSUtils
				logDebug:
					'received response ' , response class name , ' with correlation-id '
						, id asString.
			handler resolveFutureWithId: id withValue: response ]