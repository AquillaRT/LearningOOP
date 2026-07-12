Class {
	#name : 'EVariable',
	#superclass : 'EExpression',
	#instVars : [
		'id'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EVariable >> evaluateWith: aDictionary [
	"辞書の中から自分の id (#x や #y) に対応する値を取り出して返す"

	^ aDictionary at: id
]

{ #category : 'accessing' }
EVariable >> id [

	^ id
]

{ #category : 'accessing' }
EVariable >> id: aSymbol [

	id := aSymbol 
]

{ #category : 'printing' }
EVariable >> printOn: aStream [

	aStream nextPutAll: id asString
]
