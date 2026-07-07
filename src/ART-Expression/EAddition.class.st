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

{ #category : 'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [

	^ self new
		  left: anInteger;
		  right: anInteger2;
		  yourself
]

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
