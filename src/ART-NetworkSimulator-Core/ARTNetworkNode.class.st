Class {
	#name : 'ARTNetworkNode',
	#superclass : 'Object',
	#instVars : [
		'address',
		'outgoingLinks',
		'loopback',
		'arrivedPackets'
	],
	#category : 'ART-NetworkSimulator-Core',
	#package : 'ART-NetworkSimulator-Core'
}

{ #category : 'instance creation' }
ARTNetworkNode class >> withAddress: aNetworkAddress [

	^ self new
		  initializeAddress: aNetworkAddress;
		  yourself
]

{ #category : 'accessing' }
ARTNetworkNode >> address [

	^ address
]

{ #category : 'accessing' }
ARTNetworkNode >> arrivedPackets [

	^ arrivedPackets
]

{ #category : 'adding' }
ARTNetworkNode >> attach: anOutgoingLink [

	outgoingLinks add: anOutgoingLink
]

{ #category : 'processing' }
ARTNetworkNode >> consume: aPacket [
	"Default handling is to do nothing."

	
]

{ #category : 'testing' }
ARTNetworkNode >> hasLinkTo: anotherNode [

	^ outgoingLinks anySatisfy: [ :eachLink |
		  eachLink destination = anotherNode ]
]

{ #category : 'testing' }
ARTNetworkNode >> hasReceived: aPacket [
	"パケットが到着済みかを判定"

	^ arrivedPackets includes: aPacket
]

{ #category : 'initialization' }
ARTNetworkNode >> initialize [

	super initialize.
	outgoingLinks := Set new.
	arrivedPackets := OrderedCollection new.
	loopback := ARTNetworkLink from: self to: self
]

{ #category : 'initialization' }
ARTNetworkNode >> initializeAddress: aNetworkAddress [

	address := aNetworkAddress
]

{ #category : 'sending-receiving' }
ARTNetworkNode >> linksTowards: anAddress do: aBlock [
	"単純なフローディング（洪水）アルゴリズム：すべての外向きリンクを経由してルーティングします。
	ただし、受信ノード自身がルーティングの目的地である場合は、ループバックリンクのみを使用します。"

	anAddress = self address
		ifTrue: [ aBlock value: loopback ]
		ifFalse: [ outgoingLinks do: aBlock ]
]

{ #category : 'accessing' }
ARTNetworkNode >> loopback [

	^ loopback
]

{ #category : 'printing' }
ARTNetworkNode >> printOn: aStream [

	aStream
		nextPutAll: 'Node (';
		nextPutAll: address;
		nextPutAll: ')'
]

{ #category : 'sending-receiving' }
ARTNetworkNode >> receive: aPacket from: aLink [
	"送られてきたパケットの宛先アドレスが、自分自身のアドレス（address）と一致する場合、
		到着済みパケットのコレクションに追加する、
		一致しない場合は、未実装エラーを発生させて一時停止する"

	aPacket destinationAddress = address
		ifTrue: [
				self consume: aPacket. "パケットを消費（処理）する"
				arrivedPackets add: aPacket ]
		ifFalse: [ self notYetImplemented ]
]

{ #category : 'instructions' }
ARTNetworkNode >> send: aPacket [
	"パケットを送信する。ルーティングの責任はノード自身が担う。"
	self
		linksTowards: aPacket destinationAddress
		do: [ :link | self send: aPacket via: link ]
]

{ #category : 'sending-receiving' }
ARTNetworkNode >> send: aPacket via: aLink [

	aLink emit: aPacket
]
