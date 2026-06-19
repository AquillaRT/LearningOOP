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

{ #category : 'instance creation' }
Die class >> withFaces: anInteger [
	"指定された面数（anInteger）を持つ、新しいサイコロを作成して初期化する。"

	^ self new faces: anInteger; yourself 
]

{ #category : 'accessing' }
Die >> faces [
	"サイコロの面の数を外側に返す"

	^ faces
]

{ #category : 'accessing' }
Die >> faces: anInteger [
	"サイコロの面数（anInteger）を設定する。"
	
	faces := anInteger
]

{ #category : 'initialization' }
Die >> initialize [
	"新しく作られたサイコロの面の数を、デフォルトの『6』に初期化する"

	super initialize.
	faces := 6
]

{ #category : 'rolling' }
Die >> roll [
	"1 から面の数（faces）までのランダムな数値を返す"

	^ faces atRandom
]
