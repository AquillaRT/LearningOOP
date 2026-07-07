Class {
	#name : 'EConstant',
	#superclass : 'EExpression',
	#instVars : [
		'value'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EConstant >> evaluate [

	^ value
]

{ #category : 'accessing' }
EConstant >> value: anInteger [ 
	value := anInteger
]
