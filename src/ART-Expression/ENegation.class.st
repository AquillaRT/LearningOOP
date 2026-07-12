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
ENegation >> evaluateWith: aDictionary [
	"内側に抱えている expression に辞書をバケツリレーして評価させ、返ってきた結果に negated を送って反転する！"

	^ (expression evaluateWith: aDictionary) negated
]

{ #category : 'accessing' }
ENegation >> expression: anExpression [

	expression := anExpression
]

{ #category : 'arithmetic' }
ENegation >> negated [

	^ self class new expression: self
]
