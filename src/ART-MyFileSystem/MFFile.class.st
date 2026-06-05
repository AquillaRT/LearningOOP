Class {
	#name : 'MFFile',
	#superclass : 'Object',
	#instVars : [
		'parent',
		'name',
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

{ #category : 'initialization' }
MFFile >> initialize [

	contents := ''
]

{ #category : 'accessing' }
MFFile >> name [

	^ name
]

{ #category : 'accessing' }
MFFile >> name: aString [

	name := aString
]

{ #category : 'accessing' }
MFFile >> parent [

	^ parent
]

{ #category : 'accessing' }
MFFile >> parent: aFile [

	parent := aFile
]

{ #category : 'printing' }
MFFile >> printOn: aStream [

	parent ifNotNil: [ parent printOn: aStream ].
	aStream << name
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
