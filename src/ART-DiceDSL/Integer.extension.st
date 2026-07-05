Extension { #name : 'Integer' }

{ #category : '*ART-DiceDSL' }
Integer >> D10 [

	^ self D: 10
]

{ #category : '*ART-DiceDSL' }
Integer >> D20 [

	^ self D: 20
]

{ #category : '*ART-DiceDSL' }
Integer >> D4 [

	^ self D: 4
]

{ #category : '*ART-DiceDSL' }
Integer >> D6 [

	^ self D: 6
]

{ #category : '*ART-DiceDSL' }
Integer >> D: anInteger [

	| aHandle |
	aHandle := DieHandle new.
	self timesRepeat: [ aHandle addDie: (Die withFaces: anInteger) ].
	^ aHandle
]
