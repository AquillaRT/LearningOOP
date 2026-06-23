Class {
	#name : 'DieHandleTest',
	#superclass : 'TestCase',
	#category : 'ART-DiceDSL-Tests',
	#package : 'ART-DiceDSL-Tests'
}

{ #category : 'tests' }
DieHandleTest >> testAddingTwiceTheSameDice [

	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceCount equals: 1.

	handle addDie: (Die withFaces: 6).
	self assert: handle diceCount equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testCreationAdding [

	| handle |
	handle := DieHandle new
		          addDie: (Die withFaces: 6);
		          addDie: (Die withFaces: 10);
		          yourself.
	self assert: handle diceCount equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testRoll [

	| handle result |
	handle := DieHandle new
		          addDie: (Die withFaces: 6);
		          addDie: (Die withFaces: 10);
		          yourself.

	"ランダムなバグを絶対に逃さないよう、100回連続で超高速にぶん回す！"
	100 timesRepeat: [
			result := handle roll.
			"出目の合計が、あなたが教えてくれた『最小値: 2以上』かつ『最大値: 16以下』に必ず収まっているか？"
			self assert: result >= 2.
			self assert: result <= 16 ]
]

{ #category : 'tests' }
DieHandleTest >> testRollStatistical [

	| handle totalRolls sum average expectedAverage |
	handle := DieHandle new
		          addDie: (Die withFaces: 6);
		          addDie: (Die withFaces: 10);
		          yourself.

	totalRolls := 10000. "1万回ぶん回す！"
	sum := 0.

	totalRolls timesRepeat: [ sum := sum + handle roll ].

	average := sum / totalRolls asFloat.
	expectedAverage := 9.0. "理論上の期待値 (3.5 + 5.5)"

	"平均値が、理論上の期待値から±0.15の誤差の間に美しく収まっているかを検証！"
	self assert: (average - expectedAverage) abs < 0.15
]
