Class {
	#name : 'EConstant',
	#superclass : 'EExpression',
	#instVars : [
		'value'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'instance creation' }
EConstant class >> value: aNumber [

	^ self new value: aNumber
]

{ #category : 'operation' }
EConstant >> evaluate [

	^ value
]

{ #category : 'accessing' }
EConstant >> value: anInteger [ 
	value := anInteger
]
