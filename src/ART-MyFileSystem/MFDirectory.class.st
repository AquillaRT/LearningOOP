Class {
	#name : 'MFDirectory',
	#superclass : 'MFElement',
	#instVars : [
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

{ #category : 'description' }
MFDirectory >> kind [

	^ 'directory'
]

{ #category : 'printing' }
MFDirectory >> printOn: aStream [
	"自身（ディレクトリ）の文字列表現をストリームに書き込みます。
	 親がいる場合は再帰的に遡ってフルパスを構築します。"

	super printOn: aStream.
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
