tools registry
requestMetric
	^ requestMetric ifNil: [
		requestMetric := Metric new 
		name: 'micro_service_queue_request';
		description: 'Message queue request count';
		type: MetricTypeCounter;
		metricValues: { MetricValueCounter new };
		yourself ]