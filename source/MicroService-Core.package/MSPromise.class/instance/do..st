enumerating
do: aBlockClosure 
	[ (Delay forSeconds: 1) wait. self resolve: aBlockClosure value ] fork