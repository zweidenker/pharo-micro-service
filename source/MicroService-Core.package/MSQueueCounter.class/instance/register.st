tools registry
register
	MSFullQueue current announcer
		when: MSRequestHandled 
		do: [ :ann | self handleAnnouncement: ann ]