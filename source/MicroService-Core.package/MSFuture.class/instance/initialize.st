initialize
initialize
	super initialize.
	state := #unresolved.
	successHandler := OrderedCollection new.
	failHandler := OrderedCollection new