Extension { #name : 'Integer' }

{ #category : '*ART-DiceDSL' }
Integer >> D20 [

	| aHandle |
	aHandle := DieHandle new.
	self timesRepeat: [ aHandle addDie: (Die withFaces: 20) ].
	^ aHandle
]
