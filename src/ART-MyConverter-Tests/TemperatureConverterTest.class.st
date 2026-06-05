Class {
	#name : 'TemperatureConverterTest',
	#superclass : 'TestCase',
	#category : 'ART-MyConverter-Tests',
	#package : 'ART-MyConverter-Tests'
}

{ #category : 'tests' }
TemperatureConverterTest >> testCelsiusToFahrenheit [

	| converter |
	converter := TemperatureConverter new.
	self assert: (converter convertCelsius: 30) equals: 86.0
]

{ #category : 'tests' }
TemperatureConverterTest >> testFahrenheitToCelsius [

	| converter |
	converter := TemperatureConverter new.
	self assert: (converter convertFahrenheit: 86) equals: 30.0.
	self assert: (converter convertFahrenheit: 50) equals: 10
]
