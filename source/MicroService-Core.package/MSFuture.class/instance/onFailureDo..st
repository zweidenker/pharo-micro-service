enumerating
onFailureDo: aBlock
	failHandler add: aBlock.
	self isError ifTrue: [ 
		failHandler do: [:each | each value: value ] ]