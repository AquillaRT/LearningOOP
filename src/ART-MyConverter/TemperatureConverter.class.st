Class {
	#name : 'TemperatureConverter',
	#superclass : 'Object',
	#instVars : [
		'location',
		'measures'
	],
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

{ #category : 'converting' }
TemperatureConverter >> convertFahrenheitFrom: low to: high by: step [
	"Returns a collection of pairs (f, c) for all the fahrenheit
    temperatures from a low to an high temperature"

	^ (low to: high by: step) collect: [ :f |
		  f -> (self convertFahrenheit: f) ]
]

{ #category : 'accessing' }
TemperatureConverter >> dates [

	^ measures collect: [ :each | each key asDate ]
]

{ #category : 'initialization' }
TemperatureConverter >> initialize [

	super initialize.
	location := 'Nice'.
	measures := OrderedCollection new
]

{ #category : 'accessing' }
TemperatureConverter >> location [

	^ location
]

{ #category : 'accessing' }
TemperatureConverter >> location: aString [

	location := aString
]

{ #category : 'logging' }
TemperatureConverter >> measureCelsius: aTemp [

	measures add: DateAndTime now -> aTemp
]

{ #category : 'testing' }
TemperatureConverter >> measureCount [

	^ measures size
]

{ #category : 'recording' }
TemperatureConverter >> measureFahrenheit: aTemp [
	"華氏の測定値を摂氏に変換して、日付と共に measures に追加する"

	| celsius |
	celsius := self convertFahrenheit: aTemp.
	measures add: DateAndTime now -> celsius
]

{ #category : 'accessing' }
TemperatureConverter >> temperatures [

	^ measures collect: [ :each | each value ]
]

{ #category : 'accessing' }
TemperatureConverter >> times [

	^ measures collect: [ :each | each key asTime ]
]
