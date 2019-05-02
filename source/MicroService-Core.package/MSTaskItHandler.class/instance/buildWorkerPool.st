as yet unclassified
buildWorkerPool

	^ TKTCommonQueueWorkerPool new
		poolMaxSize: 5;
		start
	