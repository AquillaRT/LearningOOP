Class {
	#name : 'MFDirectory',
	#superclass : 'Object',
	#instVars : [
		'parent',
		'name',
		'files'
	],
	#category : 'ART-MyFileSystem',
	#package : 'ART-MyFileSystem'
}

{ #category : 'adding' }
MFDirectory >> addElement: aFile [
	"MFDirectoryクラスに addElement: メソッドを定義"

	"1. 追加される要素（aFile）に対して、親（parent:）は自分自身（self）であると通知する"
	aFile parent: self.

	"2. ディレクトリ自身の要素リスト（files）に、その要素を追加する"
	files add: aFile
]

{ #category : 'accessing' }
MFDirectory >> children [

	^ files
]

{ #category : 'accessing' }
MFDirectory >> files [

	^ files 
]

{ #category : 'initialization' }
MFDirectory >> initialize [

	files := OrderedCollection new
]

{ #category : 'accessing' }
MFDirectory >> name [

	^ name
]

{ #category : 'accessing' }
MFDirectory >> name: aString [

	name := aString
]

{ #category : 'accessing' }
MFDirectory >> parent [

	^ parent
]

{ #category : 'accessing' }
MFDirectory >> parent: aFile [

	parent := aFile
]

{ #category : 'printing' }
MFDirectory >> printOn: aStream [
	"自身（ディレクトリ）の文字列表現をストリームに書き込みます。
	 親がいる場合は再帰的に遡ってフルパスを構築します。"

	parent ifNotNil: [ parent printOn: aStream ].
	aStream << name.
	aStream << '/'
]

{ #category : 'accessing' }
MFDirectory >> search: aString [

	| results |
	results := OrderedCollection new.

	"中身がFileだろうがDirectoryだろうが、全員OrderedCollectionを返すので、ただマージするだけ！"
	self files do: [ :each | results addAll: (each search: aString) ].

	^ results
]

{ #category : 'accessing' }
MFDirectory >> size [

	^ name size + (files sum: [ :each | each size ]) + 2
]
