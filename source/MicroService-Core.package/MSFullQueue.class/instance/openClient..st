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
					err pass.
					MSUtils logError: 'max connect attempt reached. closing image...'.
					Error signal: 'cannot connect'
					"Smalltalk snapshot: false andQuit: true" ].
			retryCount := retryCount + 1.
			(Delay forSeconds: 5) wait.
			"ignore and repeat" ] ] repeat
