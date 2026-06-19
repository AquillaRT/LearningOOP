Class {
	#name : 'DieHandleTest',
	#superclass : 'TestCase',
	#category : 'ART-DiceDSL-Tests',
	#package : 'ART-DiceDSL-Tests'
}

{ #category : 'tests' }
DieHandleTest >> testAddingTwiceTheSameDice [

	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceCount equals: 1.

	handle addDie: (Die withFaces: 6).
	self assert: handle diceCount equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testCreationAdding [

	| handle |
	handle := DieHandle new
		          addDie: (Die withFaces: 6);
		          addDie: (Die withFaces: 10);
		          yourself.
	self assert: handle diceCount equals: 2
]
