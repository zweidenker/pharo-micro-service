accessing
metrics
	^ MetricCollection new
		metrics: { 
			Metrics garbageCollection .
			Metrics memory. 
			self zinc requestMetric . 
			self zinc responseMetric. 
			self queue requestMetric }