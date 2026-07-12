Class {
	#name : 'EBinaryExpression',
	#superclass : 'EExpression',
	#instVars : [
		'left',
		'right'
	],
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EBinaryExpression >> evaluateWith: aDictionary [
	"サブクラスに実装を強制する"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
EBinaryExpression >> left: anExpression [ 

	left := anExpression 
]

{ #category : 'printing' }
EBinaryExpression >> operatorString [
	"この式を文字列表現にするための演算子（例: ' + ', ' * '）を返してください。
	 子クラスで必ずオーバーライド（再定義）する必要があります。"

	^ self subclassResponsibility
]

{ #category : 'printing' }
EBinaryExpression >> printOn: aStream [

	aStream nextPutAll: '( '.
	left printOn: aStream.
	aStream nextPutAll: self operatorString.
	right printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : 'accessing' }
EBinaryExpression >> right: anExpression [ 

	right := anExpression 
	
]
