accessing
resolveHostname: aString
	^ [ NetNameResolver addressForName: aString ]
		on: NameLookupFailure 
		do: [ :err | nil ] 