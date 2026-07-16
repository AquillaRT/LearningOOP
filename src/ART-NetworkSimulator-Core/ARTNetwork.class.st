Class {
	#name : 'ARTNetwork',
	#superclass : 'Object',
	#instVars : [
		'nodes',
		'links'
	],
	#category : 'ART-NetworkSimulator-Core',
	#package : 'ART-NetworkSimulator-Core'
}

{ #category : 'building' }
ARTNetwork >> add: aNode [

	nodes add: aNode
]

{ #category : 'building' }
ARTNetwork >> connect: aNode to: anotherNode [
	"2つのノードをネットワークに登録し、双方向に接続します。"

	"1. 自動登録"
	self add: aNode.
	self add: anotherNode.

	"2. 双方向の接続（一時変数は不要、かつメソッドの戻り値は対称性を保つためレシーバ自身にする）"
	(ARTNetworkLink from: aNode to: anotherNode) attach.
	(ARTNetworkLink from: anotherNode to: aNode) attach
]

{ #category : 'testing' }
ARTNetwork >> doesRecordNode: aNode [

	^ nodes includes: aNode
]

{ #category : 'initialization' }
ARTNetwork >> initialize [

	super initialize.
	nodes := Set new.
	links := Set new
]

{ #category : 'private - building' }
ARTNetwork >> makeLinkFrom: aNode to: anotherNode [

	^ ARTNetworkLink from: aNode to: anotherNode
]
