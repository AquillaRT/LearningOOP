Class {
	#name : 'ARTNetworkLink',
	#superclass : 'Object',
	#instVars : [
		'source',
		'destination',
		'packets'
	],
	#category : 'ART-NetworkSimulator-Core',
	#package : 'ART-NetworkSimulator-Core'
}

{ #category : 'instance creation' }
ARTNetworkLink class >> from: sourceNode to: destinationNode [

	^ self new initializeFrom: sourceNode to: destinationNode
]

{ #category : 'operations' }
ARTNetworkLink >> attach [

	source attach: self
]

{ #category : 'accessing' }
ARTNetworkLink >> destination [

	^ destination
]

{ #category : 'sending-receiving' }
ARTNetworkLink >> emit: aPacket [
	"パケットはすぐには送信（転送）されず、いったん蓄積（保存）されます。
	送信は後から、明示的に #transmit: メッセージを送ることによってトリガー（実行）されます。"

	packets add: aPacket
]

{ #category : 'initialization' }
ARTNetworkLink >> initialize [

	packets := OrderedCollection new
]

{ #category : 'initialization' }
ARTNetworkLink >> initializeFrom: sourceNode to: destinationNode [

	source := sourceNode.
	destination := destinationNode 
]

{ #category : 'testing' }
ARTNetworkLink >> isTransmitting: aPacket [
	"指定されたパケットが、現在このリンクに蓄積されていて送信待ち状態（送信中）であるかを判定します。"
	
	^ packets includes: aPacket

]

{ #category : 'accessing' }
ARTNetworkLink >> packets [

	^ packets 
]

{ #category : 'printing' }
ARTNetworkLink >> printOn: aStream [

	aStream nextPutAll: 'Link'.
	source ifNotNil: [
			aStream
				nextPutAll: ' ';
				nextPutAll: source address ].
	destination ifNotNil: [
			aStream
				nextPutAll: ' -> ';
				nextPutAll: destination address ]
]

{ #category : 'accessing' }
ARTNetworkLink >> source [

	^ source
]

{ #category : 'sending-receiving' }
ARTNetworkLink >> transmit: aPacket [
	"受信リンク（自分自身）の宛先ノードへaPacketを送信する。"

	self packets remove: aPacket.
	destination receive: aPacket from: self
]
