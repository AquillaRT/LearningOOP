Class {
	#name : 'MFElement',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parent'
	],
	#category : 'ART-MyFileSystem',
	#package : 'ART-MyFileSystem'
}

{ #category : 'description' }
MFElement >> describe [

	^ 'I m a ' , self kind , ' named ' , name
]

{ #category : 'description' }
MFElement >> kind [

	^ 'element'
]

{ #category : 'accessing' }
MFElement >> name [

	^ name
]

{ #category : 'accessing' }
MFElement >> name: aString [

	name := aString
]

{ #category : 'accessing' }
MFElement >> parent [

	^ parent
]

{ #category : 'accessing' }
MFElement >> parent: aString [

	parent := aString 
]

{ #category : 'printing' }
MFElement >> printOn: aStream [

	parent ifNotNil: [ parent printOn: aStream ].
	aStream << name
]
