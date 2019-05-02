accessing
workerPool
	^ workerPool ifNil: [ 
		workerPool := self buildWorkerPool ]