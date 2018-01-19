accessing
handleMessage: message
	| response |
	MSUtils logInfo: 'got message: ', message asString.
	response := self materializeResponseFrom: message.
	^ delegate value: response value: message headers
