Class {
	#name : 'MFFile',
	#superclass : 'MFElement',
	#instVars : [
		'contents'
	],
	#category : 'ART-MyFileSystem',
	#package : 'ART-MyFileSystem'
}

{ #category : 'accessing' }
MFFile >> contents [

	^ contents
]

{ #category : 'accessing' }
MFFile >> contents: aString [

	contents := aString
]

{ #category : 'funTool' }
MFFile >> funky [

	^ super == self
]

{ #category : 'initialization' }
MFFile >> initialize [

	contents := ''
]

{ #category : 'description' }
MFFile >> kind [

	^ 'file'
]

{ #category : 'accessing' }
MFFile >> search: aString [
	"文字列が含まれていれば、自分の名前を入れたコレクションを返す。なければ空"

	(self contents includesSubstring: aString)
		ifTrue: [ ^ OrderedCollection with: self name ]
		ifFalse: [ ^ OrderedCollection new ]
]

{ #category : 'accessing' }
MFFile >> size [

	^ name size + contents size
]
