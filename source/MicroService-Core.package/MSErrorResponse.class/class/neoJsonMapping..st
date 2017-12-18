accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapAccessors: #(errorClassName description) ].
