Class {
	#name : 'EExpression',
	#superclass : 'Object',
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'arithmetic' }
EExpression >> negated [

	^ ENegation new expression: self
]
