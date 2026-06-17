Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'ART-DiceDSL-Tests',
	#package : 'ART-DiceDSL-Tests'
}

{ #category : 'tests' }
DieTest >> testInitializeIsOk [
	"サイコロの初期状態の面の数が 6 であることを検証する"

	self assert: Die new faces equals: 6
]
