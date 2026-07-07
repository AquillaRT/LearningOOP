Class {
	#name : 'EAddition',
	#superclass : 'EExpression',
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

{ #category : 'accesser' }
EAddition >> right: anExpression [ 
	right := anExpression
]
