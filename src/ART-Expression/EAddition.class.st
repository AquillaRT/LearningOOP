Class {
	#name : 'EAddition',
	#superclass : 'Object',
	#instVars : [
		'left',
		'right'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EAddition >> evaluate [
	^ left evaluate + right evaluate
]

{ #category : 'accesser' }
EAddition >> left: anExpression [ 
	left := anExpression
]

{ #category : 'arithmetic' }
EAddition >> negated [

	^ ENegation new expression: self
]

{ #category : 'accesser' }
EAddition >> right: anExpression [ 
	right := anExpression
]
