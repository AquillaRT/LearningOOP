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

{ #category : 'instance creation' }
EMultiplication class >> left: anExp right: anExp2 [

	^ self new
		  left: anExp;
		  right: anExp2;
		  yourself
]

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
