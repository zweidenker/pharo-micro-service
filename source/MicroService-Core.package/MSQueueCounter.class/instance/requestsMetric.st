tools registry
requestsMetric
	<metric>
	^ Metric new 
		name: #httpRequests;
		group: #msqueue;
		description: 'Number of message queue requests';
		type: #counter;
		valueBlock: [ MSQueueCounter instance requests ]