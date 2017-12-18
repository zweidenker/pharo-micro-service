accessing
log: anObject level: aLoglevel
	WrapperSignal new
		target: anObject;
		level: aLoglevel;
		tag: logTag;
		emit.