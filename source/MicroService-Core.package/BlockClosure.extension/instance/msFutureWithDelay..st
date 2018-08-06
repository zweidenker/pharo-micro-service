*MicroService-Core
msFutureWithDelay: aDuration 
	| future |
	future := MSFuture new.
	[ 
		[ future resolve: self value ]
			on: Error 
			do: [:error | future resolveError: error ].
	] valueAfterWaiting: aDuration asDelay.
	^ future