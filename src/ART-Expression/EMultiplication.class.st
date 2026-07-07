Class {
	#name : 'EMultiplication',
	#superclass : 'EExpression',
	#instVars : [
		'right',
		'left'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EMultiplication >> evaluate [

	^ left evaluate * right evaluate
]

{ #category : 'accessing' }
EMultiplication >> left: anExpression [

	left := anExpression
]

{ #category : 'accessing' }
EMultiplication >> right: anExpression [

	right := anExpression
]
