Class {
	#name : 'EMultiplication',
	#superclass : 'EBinaryExpression',
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'instance creation' }
EMultiplication class >> left: anExp right: anExp2 [

	^ self new
		  left: anExp;
		  right: anExp2;
		  yourself
]

{ #category : 'operation' }
EMultiplication >> evaluateWith: aDictionary [
	"受け取った辞書を左右の子要素にそのままパスして評価させ、その結果を掛け算する"

	^ (left evaluateWith: aDictionary)
	  * (right evaluateWith: aDictionary)
]

{ #category : 'printing' }
EMultiplication >> operatorString [

	^ ' * '
]
