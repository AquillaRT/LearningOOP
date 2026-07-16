Class {
	#name : 'ARTNetworkEntitiesTest',
	#superclass : 'TestCase',
	#category : 'ART-NetworkSimulator-Tests',
	#package : 'ART-NetworkSimulator-Tests'
}

{ #category : 'tests' }
ARTNetworkEntitiesTest >> testLoopback [

	| node packet |
	node := ARTNetworkNode withAddress: #address.
	packet := ARTNetworkPacket
		          from: #address
		          to: #address
		          payload: #payload.
	node send: packet.
	node loopback transmit: packet.
	self assert: (node hasReceived: packet).
	self deny: (node loopback isTransmitting: packet)
]

{ #category : 'tests' }
ARTNetworkEntitiesTest >> testNodeCreation [

	| address node |
	address := Object new.
	node := ARTNetworkNode withAddress: address.
	self assert: node address equals: address
]

{ #category : 'tests' }
ARTNetworkEntitiesTest >> testNodeLinking [

	| node1 node2 link |
	node1 := ARTNetworkNode withAddress: #address1.
	node2 := ARTNetworkNode withAddress: #address2.
	link := ARTNetworkLink from: node1 to: node2.
	link attach.
	self assert: (node1 hasLinkTo: node2)
]

{ #category : 'tests' }
ARTNetworkEntitiesTest >> testPacketCreation [

	| src dest payload packet |
	src := Object new.
	dest := Object new.
	payload := Object new.
	packet := ARTNetworkPacket from: src to: dest payload: payload.
	self assert: packet sourceAddress equals: src.
	self assert: packet destinationAddress equals: dest.
	self assert: packet payload equals: payload
]

{ #category : 'tests' }
ARTNetworkEntitiesTest >> testSendAndTransmit [

	| srcNode destNode link packet |
	srcNode := ARTNetworkNode withAddress: #src.
	destNode := ARTNetworkNode withAddress: #dest.
	link := (ARTNetworkLink from: srcNode to: destNode)
		        attach;
		        yourself.
	packet := ARTNetworkPacket from: #address to: #dest payload: #payload.

	srcNode send: packet via: link.
	self assert: (link isTransmitting: packet).
	self deny: (destNode hasReceived: packet).

	link transmit: packet.
	self deny: (link isTransmitting: packet).
	self assert: (destNode hasReceived: packet)
]
