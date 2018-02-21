enumerating
onFailureDo: aBlock
	failHandler add: aBlock.
	self isError ifTrue: [ 
		failHandler value: value ]