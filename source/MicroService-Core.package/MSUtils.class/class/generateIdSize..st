as yet unclassified
generateIdSize: aNumber
	^ String
		new: aNumber
		streamContents: [ :stream | 
			aNumber timesRepeat: [ stream nextPut: '0123456789ABCDEF' atRandom ] ]
	