Class {
	#name : 'EConstant',
	#superclass : 'Object',
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

{ #category : 'arithmetic' }
EConstant >> negated [

	^ ENegation new expression: self
]

{ #category : 'accessing' }
EConstant >> value: anInteger [ 
	value := anInteger
]
