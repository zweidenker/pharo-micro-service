accessing
queue
	^ queue ifNil: [ 
		queue := MSQMetricSet new ]