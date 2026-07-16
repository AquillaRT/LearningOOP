Class {
	#name : 'ARTNetworkPacket',
	#superclass : 'Object',
	#instVars : [
		'sourceAddress',
		'destinationAddress',
		'payload'
	],
	#category : 'ART-NetworkSimulator-Core',
	#package : 'ART-NetworkSimulator-Core'
}

{ #category : 'instance creation' }
ARTNetworkPacket class >> from: sourceAddress to: destinationAddress payload: anObject [

	^ self new
		  initializeSource: sourceAddress
		  destination: destinationAddress
		  payload: anObject
]

{ #category : 'accessing' }
ARTNetworkPacket >> destinationAddress [

	^ destinationAddress
]

{ #category : 'initialization' }
ARTNetworkPacket >> initializeSource: aSourceAddress destination: aDestinationAddress payload: aPayload [

	sourceAddress := aSourceAddress.
	destinationAddress := aDestinationAddress.
	payload := aPayload
]

{ #category : 'accessing' }
ARTNetworkPacket >> payload [

	^ payload
]

{ #category : 'accessing' }
ARTNetworkPacket >> sourceAddress [

	^ sourceAddress
]
