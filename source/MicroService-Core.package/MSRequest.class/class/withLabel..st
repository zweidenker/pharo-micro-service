accessing
withLabel: aString
	^ (self allSubclasses reject: #isAbstract)
		detect: [ :cls | cls label = aString ]
		ifNone: [ MSCommandNotFound signal: 'no command with label ', aString asString, ' found' ]