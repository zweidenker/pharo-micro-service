accessing
logError: error
	MSUtils logError: error.
	Smalltalk  
		at: #SnapDump
		ifPresent: [ :reporter | reporter handleException: error ].