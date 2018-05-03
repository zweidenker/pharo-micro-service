accessing
value
	self isResolved ifFalse: [ 
		Transcript show: 'wait for value'; cr.
		valueSemaphore wait.
		Transcript show: 'released from waiting'; cr ].
	(state == #error) ifTrue: [
		value signal ].
	^ value