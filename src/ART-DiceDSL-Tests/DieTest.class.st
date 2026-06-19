Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'ART-DiceDSL-Tests',
	#package : 'ART-DiceDSL-Tests'
}

{ #category : 'tests' }
DieTest >> testCreationIsOk [

	self assert: (Die withFaces: 20) faces equals: 20
]

{ #category : 'tests' }
DieTest >> testInitializeIsOk [
	"サイコロの初期状態の面の数が 6 であることを検証する"

	self assert: Die new faces equals: 6
]

{ #category : 'tests' }
DieTest >> testRolling [
	"サイコロを10回振り、すべて1から6の間に収まっているかを検証する"

	| d |
	d := Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]
