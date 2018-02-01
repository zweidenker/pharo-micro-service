enumerating
do: aBlock
	process := [ 
		(Delay forMilliseconds: 100 + 500 atRandom) wait. 
		MSUtils logDebug: 'firing local future ', self asString.
		aBlock value ] fork.