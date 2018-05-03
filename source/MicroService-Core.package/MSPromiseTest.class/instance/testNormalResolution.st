tests
testNormalResolution
	| promise |
	promise := MSPromise new.
	promise do: [ 1 ].
	self assert: promise value equals: 1