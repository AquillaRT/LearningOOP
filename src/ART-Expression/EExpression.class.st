Class {
	#name : 'EExpression',
	#superclass : 'Object',
	#category : 'ART-Expression',
	#package : 'ART-Expression'
}

{ #category : 'operation' }
EExpression >> evaluate [
	"【デリゲートの核心】"
	"引数なしで呼ばれたら、空の辞書（環境）を生成して引数あり版に仕事を丸投げする！"

	^ self evaluateWith: Dictionary new
]

{ #category : 'operation' }
EExpression >> evaluateWith: aDictionary [
	"サブクラスに実装を強制する"

	^ self subclassResponsibility
]

{ #category : 'arithmetic' }
EExpression >> negated [

	^ ENegation new expression: self
]
