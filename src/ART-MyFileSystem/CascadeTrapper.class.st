Class {
	#name : 'CascadeTrapper',
	#superclass : 'Object',
	#instVars : [
		'currentValue'
	],
	#category : 'ART-MyFileSystem',
	#package : 'ART-MyFileSystem'
}

{ #category : 'arithmetic' }
CascadeTrapper >> + anInteger [
	"1. 整数としての本来の足し算を実行し、戻り値をトラップする！"

	currentValue := currentValue + anInteger.

	"2. カスケードは戻り値を捨てるので、ここは何を返してもOK。
        ただし、自分自身（self）を返しておけば安心です"
	^ self
]

{ #category : 'private - buffers' }
CascadeTrapper >> finalValue [

	^ currentValue
]

{ #category : 'accessing' }
CascadeTrapper >> value: aNumber [

	currentValue := aNumber
]
