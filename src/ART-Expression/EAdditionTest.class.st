Class {
	#name : 'EAdditionTest',
	#superclass : 'TestCase',
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'tests' }
EAdditionTest >> testAdditionWithNegation [

	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := ENegation new expression: ep1. "これで -5"

	"5 + (-5) = 0 のテスト"
	self
		assert: (EAddition new
				 right: ep1;
				 left: ep2) evaluate
		equals: 0
]

{ #category : 'tests' }
EAdditionTest >> testEvaluate [

	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self
		assert: (EAddition new right: ep1; left: ep2) evaluate equals: 8
]

{ #category : 'tests' }
EAdditionTest >> testEvaluateWithNegation [

	| ep1 ep2 |
	ep1 := ENegation new expression: (EConstant new value: 5).
	ep2 := EConstant new value: 3.
	self
		assert: (EAddition new
				 right: ep1;
				 left: ep2) evaluate
		equals: -2
]

{ #category : 'tests' }
EAdditionTest >> testNegated [

	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self
		assert: (EAddition new
				 right: ep1;
				 left: ep2) negated evaluate
		equals: -8
]
