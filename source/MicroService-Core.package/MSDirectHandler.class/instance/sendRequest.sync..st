accessing
sendRequest: aRequest sync: aBoolean
	^ aBoolean 
		ifTrue: [ aRequest directCall: delegate ]
		ifFalse: [ 
			MSLocalFuture new 
				do: [ aRequest directCall: delegate ];
				yourself ]