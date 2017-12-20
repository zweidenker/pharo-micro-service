accessing
client
	^ client ifNil: [ 
		client := self createClient ]