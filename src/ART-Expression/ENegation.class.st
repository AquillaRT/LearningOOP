Class {
	#name : 'ENegation',
	#superclass : 'EExpression',
	#instVars : [
		'expression'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'instance creation' }
ENegation class >> expression: anExpression [

	^ self new expression: anExpression
]

{ #category : 'operation' }
ENegation >> evaluate [

	^ expression evaluate negated
]

{ #category : 'accessing' }
ENegation >> expression: anExpression [

	expression := anExpression
]

{ #category : 'arithmetic' }
ENegation >> negated [

	^ self class new expression: self
]
