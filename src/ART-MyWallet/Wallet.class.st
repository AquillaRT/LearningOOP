Class {
	#name : 'Wallet',
	#superclass : 'Object',
	#instVars : [
		'money',
		'bagCoins'
	],
	#category : 'ART-MyWallet',
	#package : 'ART-MyWallet'
}

{ #category : 'adding' }
Wallet >> add: aCoinCount coinsOfValue: aCoinValue [

	bagCoins add: aCoinValue withOccurrences: aCoinCount 
]

{ #category : 'adding' }
Wallet >> addAllCoins: aBag [
	"渡されたBagの中身（コインの額面とその枚数）を、このお財布にすべて追加する"

	aBag keysAndValuesDo: [ :coinValue :count |
		self add: count coinsOfValue: coinValue ]
]

{ #category : 'accessing' }
Wallet >> addCoin: aCoinValuer [ 

	self add: 1 coinsOfValue: aCoinValuer 
]

{ #category : 'accessing' }
Wallet >> bagCoins [

	^ bagCoins
]

{ #category : 'testing' }
Wallet >> biggest [
	"Returns the biggest coin with a value below anAmount. For
	example, {(3 -> 0.5) . (3 -> 0.2) . (5-> 0.1)} biggest -> 0.5"

	"bagCoinsコレクションの中から、最も大きい数値を一発で引っこ抜いて返す！"
	^ bagCoins max
]

{ #category : 'removing' }
Wallet >> biggestAndRemove [

	| b |
	"★ガードレール：空っぽなら何もせず nil を返す。これでドミノ倒しを完全シャットアウト！"
	bagCoins isEmpty ifTrue: [ ^ nil ].

	b := self biggest.
	self removeCoin: b. "私たちの作った『委譲スタイル』のremoveCoin:なら100%安全！"
	^ b
]

{ #category : 'testing' }
Wallet >> biggestBelow: anAmount [

	"1. もし空じゃなければ、その中で max を計算して【即座にメソッドごとリターン】する！"
	(bagCoins select: [ :each | each < anAmount ]) ifNotEmpty: [
		:filtered | ^ filtered max ]. "← ブロックの中に ^ を入れる！"

	"2. 上の条件に引っかからなかった（空だった）場合は、ここに落ちてきて 0 を返す"
	^ 0
]

{ #category : 'testing' }
Wallet >> canPay: amountOfMoney [
	"returns true when we can pay the amount of money"

	^ self money >= amountOfMoney
]

{ #category : 'accessing' }
Wallet >> coinCount [
	"お財布に入っているコインの総枚数を返す"

	^ bagCoins size
]

{ #category : 'removing' }
Wallet >> coinsFor: aValue [
	"指定された金額を支払うためのコインを『調べる』。元のお財布は無傷（コピーを使用）。"

	| res walletReplica |
	res := self class new.
	walletReplica := self class new addAllCoins: self bagCoins copy. "← ディープコピー"

	^ (walletReplica canPay: aValue)
		  ifFalse: [ res ]
		  ifTrue: [ "← レプリカを削って計算" walletReplica coinsFor: aValue into: res ]
]

{ #category : 'removing' }
Wallet >> coinsFor: aValue into: accuWallet [
	"指定された金額を支払うために、最も大きなコインから順に accuWallet に詰める。
	（注意：このファーストバージョンでは、計算の過程で元の財布の中身が消費されます）"

	| remainingCoinValue currentCoin |
	"1. 金額を ScaledDecimal に変換して Float の演算誤差を完全に対策"
	remainingCoinValue := aValue asScaledDecimal: 2.

	"2. 目標金額が残り、かつお財布にコインがある間ループ"
	[ remainingCoinValue > 0 and: [ bagCoins isNotEmpty ] ] whileTrue: [ "一番大きなコインを現物として1枚取り出す"
			currentCoin := self biggestAndRemove.

			"3. 取り出したコインが残り目標金額に収まるか判定"
			currentCoin <= remainingCoinValue ifTrue: [ "払えるなら新しいお財布に詰めて、目標額を引き算""※大きすぎるコインは、そのままどこにも詰めずにスルー（消費）"
					accuWallet add: 1 coinsOfValue: currentCoin.
					remainingCoinValue := remainingCoinValue - currentCoin ] ].

	^ accuWallet
]

{ #category : 'accessing' }
Wallet >> coinsOfValue: aCoinValue [
	"意味のとりやすさから、引数をaCoinValueにした。"

	^ bagCoins occurrencesOf: aCoinValue
]

{ #category : 'initialization' }
Wallet >> initialize [ 

	super initialize .
	bagCoins := Bag new
]

{ #category : 'accessing' }
Wallet >> money [
	"bagCoinsに入っているすべてのコインを、初期値 0 から順に足し合わせる"

	^ bagCoins inject: 0 into: [ :sum :eachCoin | sum + eachCoin ]
]

{ #category : 'printing' }
Wallet >> printOn: aStream [

	super printOn: aStream.
	"カンマで繋がず、ストリームに直接順番に放り込む！これが最速！"
	aStream
		nextPut: Character space;		 		"スペースを1文字送る（$  でも可）"
		nextPut: $(;             				"開きカッコを1文字送る"
		nextPutAll: self money asString;
		nextPut: $)                     	"文字（Character）は nextPut: で放り込めます"
]

{ #category : 'removing' }
Wallet >> remove: aCoinCount coinsOfValue: aCoinValue [

	(self coinsOfValue: aCoinValue) < aCoinCount ifTrue: [
			Transcript
				show: '[Wallet] Warning: Not enough coins. Canceled.';
				cr.
			^ self ].
	aCoinCount timesRepeat: [ bagCoins remove: aCoinValue ]
]

{ #category : 'removing' }
Wallet >> removeCoin: aCoinValue [
	"Remove from the receiver a coin of value aCoinValue"

	bagCoins remove: aCoinValue
]
