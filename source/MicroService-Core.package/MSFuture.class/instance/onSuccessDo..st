enumerating
onSuccessDo: aBlock
	successHandler add: aBlock.
	self isResolved ifTrue: [ 
		successHandler do: [:each | each value: value ] ]