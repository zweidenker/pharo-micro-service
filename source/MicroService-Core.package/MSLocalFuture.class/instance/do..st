enumerating
do: aBlock
	process := [ 
		(Delay forMilliseconds: 100) wait. 
		MSUtils logDebug: 'firing local future ', self.
		aBlock value ] fork.