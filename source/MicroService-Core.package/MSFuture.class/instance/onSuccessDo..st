enumerating
onSuccessDo: aBlock
	successHandler add: aBlock.
	self isResolved ifTrue: [ 
		successHandler value: value ]