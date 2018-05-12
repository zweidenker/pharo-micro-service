enumerating
withSenderDo: aBlock
	senderSemaphore critical: [ | client |
		client := self senderClient. 
		client isConnected ifFalse: [ 
			MSUtils logInfo: 'connection is not connected. connecting...'.
			[ client open ]
				on: StampError 
				do: [ :err | 
					MSUtils logError: 'got stamp error while opening connection' "ignore" ] ].
		aBlock value: client ]