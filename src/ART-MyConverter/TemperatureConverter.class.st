Class {
	#name : 'TemperatureConverter',
	#superclass : 'Object',
	#category : 'ART-MyConverter',
	#package : 'ART-MyConverter'
}

{ #category : 'converting' }
TemperatureConverter >> convertCelsius: aNumber [
	"Convert aNumber from celsius to fahrenheit"

	^ aNumber * 1.8 + 32
]

{ #category : 'converting' }
TemperatureConverter >> convertFahrenheit: aNumver [
	"Convert aNumber from fahrenheit to celsius"

	^ (aNumver - 32) / 1.8
]
