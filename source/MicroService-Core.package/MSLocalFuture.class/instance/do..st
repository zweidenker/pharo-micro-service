enumerating
do: aBlock
	process := [
		self resolve: aBlock value ] fork.