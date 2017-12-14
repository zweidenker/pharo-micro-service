accessing
pingHost: hostname port: port
	^ [ Socket pingPorts: { port } on: hostname timeOutSecs: 2 ]
		on: ConnectionTimedOut 
		do: [ :err | nil ]