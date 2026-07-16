Class {
	#name : 'ARTNetworkTest',
	#superclass : 'TestCase',
	#instVars : [
		'net',
		'hub',
		'alone'
	],
	#category : 'ART-NetworkSimulator-Tests',
	#package : 'ART-NetworkSimulator-Tests'
}

{ #category : 'private - helpers' }
ARTNetworkTest >> buildNetwork [

	alone := ARTNetworkNode withAddress: #alone.
	net := ARTNetwork new.
	hub := ARTNetworkNode withAddress: #hub.
	#( mac pc1 pc2 prn ) do: [ :addr |
			| node |
			node := ARTNetworkNode withAddress: addr.
			net connect: node to: hub ].
	net
		connect: (ARTNetworkNode withAddress: #ping)
		to: (ARTNetworkNode withAddress: #pong)
]

{ #category : 'running' }
ARTNetworkTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	self buildNetwork
	
]

{ #category : 'tests' }
ARTNetworkTest >> testConnect [

	| netw hubb mac pc1 |
	netw := ARTNetwork new.
	hubb := ARTNetworkNode withAddress: #hub.
	mac := ARTNetworkNode withAddress: #mac.
	pc1 := ARTNetworkNode withAddress: #pc1.

	netw connect: hubb to: mac.

	"双方向にリンクが張られていることを確認"
	self assert: (hubb hasLinkTo: mac).
	self assert: (mac hasLinkTo: hubb).
	"ノードが自動的にネットワークに登録されていることを確認"
	self assert: (netw doesRecordNode: hubb).
	self assert: (netw doesRecordNode: mac).

	netw connect: hubb to: pc1.

	"新しく追加した接続と、既存の接続が正しく維持されているかを確認"
	self assert: (hubb hasLinkTo: pc1).
	self assert: (mac hasLinkTo: hubb)
]

{ #category : 'tests' }
ARTNetworkTest >> testNetworkFindsNodesByAddress [

	self
		assert: (net nodeAt: hub address ifNone: [ self fail ])
		equals: hub
]
