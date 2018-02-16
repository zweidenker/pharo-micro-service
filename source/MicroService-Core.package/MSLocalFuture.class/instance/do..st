enumerating
do: aBlock
	process := [ 
		(Delay forMilliseconds: 20 + 200 atRandom) wait. 
		MSUtils logDebug: 'firing local future ', self asString.
		aBlock value ] fork.