as yet unclassified
openClient: aClient
	| retryCount |
	retryCount := 0.
	[ [ ^ aClient open ]
		on: Error 
		do: [:err|
			MSUtils logError: err asString. 
			MSUtils logError: 'attempt ', retryCount asString, ' of 5'.
			(retryCount < 5) 
				ifFalse: [ 
					MSUtils logError: 'max connect attempt reached. closing image...'.
					Smalltalk snapshot: false andQuit: true].
			retryCount := retryCount + 1.
			(Delay forSeconds: 5) wait.
			"ignore and repeat" ] ] repeat
