initialization
initialize
	super initialize.
	senderSemaphore := Semaphore forMutualExclusion.