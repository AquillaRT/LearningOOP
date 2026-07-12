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
EConstant >> evaluateWith: aDictionary [
	"辞書は使わないので無視し、自分の固定値をそのまま返す"

	^ value
]

{ #category : 'accessing' }
EConstant >> value: aNumber [

	value := aNumber
]
