Class {
	#name : 'EAddition',
	#superclass : 'EBinaryExpression',
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
EAddition >> evaluateWith: aDictionary [
	"受け取った辞書を左右の子要素にそのままパスして評価させ、その結果を足し算する"

	^ (left evaluateWith: aDictionary)
	  + (right evaluateWith: aDictionary)
]

{ #category : 'printing' }
EAddition >> operatorString [

	^ ' + '
]
