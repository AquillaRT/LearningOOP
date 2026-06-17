"
I represent a single die (a gaming dice) with a specific number of faces.
By default, I am created as a 6-sided die.

I can be rolled to generate a random number between 1 and my number of faces.

Example:
   Die new roll. ""Returns a number between 1 and 6""
"
Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'ART-DiceDSL',
	#package : 'ART-DiceDSL'
}

{ #category : 'accessing' }
Die >> faces [
	"サイコロの面の数を外側に返す"

	^ faces
]

{ #category : 'initialization' }
Die >> initialize [
	"新しく作られたサイコロの面の数を、デフォルトの『6』に初期化する"

	super initialize.
	faces := 6
]
