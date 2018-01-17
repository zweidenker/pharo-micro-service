accessing
dispatchRequest: aMSRequest sync: aBoolean
	^ aBoolean 
		ifTrue: [ aMSRequest directCall: service ]
		ifFalse: [ [ aMSRequest directCall: service ] future ]