as yet unclassified
then: aBlock
	| next |
	next := MMFuture new.
	self onSuccessDo: [ :v |
		next resolve: (aBlock value: v ) ].
	^ next
		
		