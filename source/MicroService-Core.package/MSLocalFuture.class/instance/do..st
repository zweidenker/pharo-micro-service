enumerating
do: aBlock
	process := [ 
		(Delay forMilliseconds: 100 + 2000 atRandom) wait. 
		MSUtils logDebug: 'firing local future ', self asString.
		aBlock value ] fork.