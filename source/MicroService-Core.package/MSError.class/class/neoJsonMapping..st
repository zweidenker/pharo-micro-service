accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapInstVars: { #messageText } ].
