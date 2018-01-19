enumerating
do: aBlock
	process := [ (Delay forMilliseconds: 500) wait. aBlock value ] fork.