Class {
	#name : 'WalletTest',
	#superclass : 'TestCase',
	#category : 'ART-MyWallet-Tests',
	#package : 'ART-MyWallet-Tests'
}

{ #category : 'tests' }
WalletTest >> testAddOneCoin [

	| w |
	w := Wallet new.

	"引数に s2 をつけて、Floatの罠を完全無効化！"
	w addCoin: 0.50s2.

	"アサートもモダンなスタイルに統一！"
	self assert: (w coinsOfValue: 0.5s2) equals: 1.
	self assert: w money equals: 0.50s2
]

{ #category : 'tests' }
WalletTest >> testBiggestAndRemove [

	| w biggest |
	w := Wallet new.

	"1. 空のお財布で実行してみる（安全性の検証）"
	self assert: w biggestAndRemove isNil.

	"2. コインをバラバラに入れてみる（0.10s2、0.50s2、0.05s2）"
	w add: 1 coinsOfValue: 0.10s2.
	w add: 1 coinsOfValue: 0.50s2. "← こいつが一番大きいはず！"
	w add: 1 coinsOfValue: 0.05s2.

	"3. 一番大きいのを取り出す！"
	biggest := w biggestAndRemove.

	"★アサート：返ってきたのは『0.50s2』であるべき！"
	self assert: biggest equals: 0.50s2.

	"★アサート：お財布の中を確認。0.50s2 は消えて、残り2枚（0.10s2 と 0.05s2）のはず！"
	self assert: (w coinsOfValue: 0.50s2) equals: 0.
	self assert: w money equals: 0.15s2
]

{ #category : 'tests' }
WalletTest >> testBiggestCoins [

	| w |
	w := Wallet new.
	w add: 10 coinsOfValue: 0.50s2. "← 鉄壁の ScaledDecimal 防御陣形！"
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.

	"先生の指定通り、シンプルに biggest をアサート！"
	self assert: w biggest equals: 0.50s2
]

{ #category : 'tests' }
WalletTest >> testBiggestCoinsBelow [

	| w |
	w := Wallet new.
	w add: 10 coinsOfValue: 0.50s2.
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.

	"カッコを外して、モダンな equals: スタイルに清書！"
	self assert: (w biggestBelow: 1s2) equals: 0.50s2.
	self assert: (w biggestBelow: 0.5s2) equals: 0.20s2.
	self assert: (w biggestBelow: 0.48s2) equals: 0.20s2.
	self assert: (w biggestBelow: 0.20s2) equals: 0.10s2.
	self assert: (w biggestBelow: 0.10s2) equals: 0
]

{ #category : 'tests' }
WalletTest >> testCanPay [

	| w |
	w := Wallet new.
	w add: 2 coinsOfValue: 0.50s2. "← 堅牢な ScaledDecimal 陣形を維持！"
	w add: 3 coinsOfValue: 0.20s2.
	w add: 1 coinsOfValue: 0.02s2.
	w add: 5 coinsOfValue: 0.05s2.

	"『assert: (...) not』を、よりSmalltalkらしく読みやすい『deny:』に洗練！"
	self deny: (w canPay: 2s2).

	"こちらは支払えることを堂々とアサート"
	self assert: (w canPay: 0.50s2)
]

{ #category : 'tests' }
WalletTest >> testCoinsAddition [

	| w |
	w := Wallet new.
	w add: 2 coinsOfValue: 0.50.
	w add: 3 coinsOfValue: 0.20.
	self assert: (w coinsOfValue: 0.5) equals: 2
]

{ #category : 'tests' }
WalletTest >> testCoinsAdditionIsWorking [

	| w |
	w := Wallet new.
	"50セントを2枚入れる"
	w add: 2 coinsOfValue: 0.50.
	"さらに50セントを6枚追加する"
	w add: 6 coinsOfValue: 0.50.
	"2 + 6 = 8枚にちゃんとなっているか、親切な equals: で検証！"
	self assert: (w coinsOfValue: 0.5) equals: 8
]

{ #category : 'tests' }
WalletTest >> testCoinsCount [

	| w |
	w := Wallet new.
	w add: 2 coinsOfValue: 0.50.
	w add: 3 coinsOfValue: 0.20.
	self assert: w coinCount = 5 "← 圧倒的に座りが良い！！"
]

{ #category : 'tests' }
WalletTest >> testCoinsFor [

	| w paidWallet |
	w := Wallet new.

	"1. お財布にコインを仕込む（合計：2.60s2）"
	w add: 2 coinsOfValue: 0.50s2. "1.00s2"
	w add: 3 coinsOfValue: 0.20s2. "0.60s2"
	w add: 1 coinsOfValue: 1.00s2. "1.00s2"

	"2. 0.70s2（70セント）を支払うためのコインを『調べる』"
	paidWallet := w coinsFor: 0.70s2.

	"3. 検証①：新しく返ってきたお財布の中身が正しいか？"
	self assert: paidWallet money equals: 0.70s2.
	self assert: (paidWallet coinsOfValue: 0.50s2) equals: 1.
	self assert: (paidWallet coinsOfValue: 0.20s2) equals: 1.

	"★4. 検証②【ここを追加！】元のお財布が『無傷』であることを証明する！"
	"調べるだけなので、元のお財布の残高は 2.60s2 から絶対に減っていてはならない！"
	self assert: w money equals: 2.60s2.
	self assert: (w coinsOfValue: 1.00s2) equals: 1.
	self assert: (w coinsOfValue: 0.50s2) equals: 2.
	self assert: (w coinsOfValue: 0.20s2) equals: 3
]

{ #category : 'tests' }
WalletTest >> testCoinsForPaying [

	| w paid |
	w := Wallet new.
	w add: 10 coinsOfValue: 0.50.
	w add: 10 coinsOfValue: 0.20.
	w add: 10 coinsOfValue: 0.10.
	paid := w coinsFor: 2.5.
	self assert: paid money equals: 2.5.
	self assert: (paid coinsOfValue: 0.5) equals: 5
]

{ #category : 'tests' }
WalletTest >> testCoinsForPayingWithOtherCoins [

	| w paid |
	w := Wallet new. "← 隔離クラスを使用！"
	w add: 1 coinsOfValue: 0.50s2.
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.
	paid := w coinsFor: 2.4s2.
	self assert: paid money equals: 2.4s2.
	self assert: (paid coinsOfValue: 0.5s2) equals: 1s2.
	self assert: (paid coinsOfValue: 0.2s2) equals: 9s2
]

{ #category : 'tests' }
WalletTest >> testCoinsForPayingWithOtherThanTop [

	| w paid |
	w := Wallet new. "← 隔離クラスを使用！"
	w add: 1 coinsOfValue: 0.50s2.
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.

	paid := w coinsFor: 0.6s2.

	"アサーション検証（0.50 を選んだ後、0.20 をスルーして 0.10 を選べるか！？）"
	self assert: paid money equals: 0.6s2.
	self assert: (paid coinsOfValue: 0.5s2) equals: 1s2.
	self assert: (paid coinsOfValue: 0.1s2) equals: 1s2
]

{ #category : 'tests' }
WalletTest >> testCoinsForPayingWithOtherThanTopMoreDifficult [

	| w paid |
	w := Wallet new. "← 隔離クラスを使用！"
	w add: 2 coinsOfValue: 0.50s2. "← 0.50ユーロが2枚に増殖！"
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.

	paid := w coinsFor: 0.6s2.

	"アサーション検証（1枚目の0.50を取った後、2枚目の0.50と、続く0.20を連続スキップできるか！？）"
	self assert: paid money equals: 0.6s2.
	self assert: (paid coinsOfValue: 0.5s2) equals: 1s2.
	self assert: (paid coinsOfValue: 0.1s2) equals: 1s2
]

{ #category : 'tests' }
WalletTest >> testCoinsForPayingWithOtherThanTopMoreDifficult2 [

	| w paid |
	w := Wallet new. "← 隔離クラスを使用！"
	w add: 1 coinsOfValue: 1s2. "← 【新登場】1ユーロという巨大な罠！"
	w add: 2 coinsOfValue: 0.50s2.
	w add: 10 coinsOfValue: 0.20s2.
	w add: 10 coinsOfValue: 0.10s2.

	paid := w coinsFor: 0.6s2.

	"アサーション検証（1ユーロを無視し、50セントを1枚取り、残りの50セントと20セントをスルーして、10セントを取る）"
	self assert: paid money equals: 0.6s2.
	self assert: (paid coinsOfValue: 0.5s2) equals: 1s2.
	self assert: (paid coinsOfValue: 0.1s2) equals: 1s2
]

{ #category : 'tests' }
WalletTest >> testMoney [

	| w |
	w := Wallet new.
	w add: 2 coinsOfValue: 0.50s2.
	w add: 3 coinsOfValue: 0.20s2.
	w add: 1 coinsOfValue: 0.02s2.
	"筆者の『=』を、失敗した時に親切な『equals:』にアップグレード！"
	self assert: w money equals: 1.62s2
]

{ #category : 'tests' }
WalletTest >> testMoney2 [

	| w |
	w := Wallet new.
	w add: 2 coinsOfValue: 0.50s2.
	w add: 3 coinsOfValue: 0.20s2.
	w add: 1 coinsOfValue: 0.02s2.
	w add: 5 coinsOfValue: 0.05s2.
	"ここも失敗した時に差額がひと目でわかる equals: にアップグレード！"
	self assert: w money equals: 1.87s2
]

{ #category : 'tests' }
WalletTest >> testRemove [

	| w |
	w := Wallet new.

	"すべて s2 を付与し、Floatの誤差をこの世から抹殺する"
	w add: 2 coinsOfValue: 0.50s2.
	w add: 3 coinsOfValue: 0.20s2.
	w add: 1 coinsOfValue: 0.02s2.
	w add: 5 coinsOfValue: 0.05s2.

	"コインを1枚取り出す"
	w removeCoin: 0.5s2.

	"アサートもモダンな equals: スタイルに統一！"
	self assert: w money equals: 1.37s2
]

{ #category : 'tests' }
WalletTest >> testRemoveCoins [

	| w |
	w := Wallet new.
	w add: 5 coinsOfValue: 0.50s2.

	"正常系検証"
	w remove: 2 coinsOfValue: 0.50s2.
	self assert: (w coinsOfValue: 0.50s2) equals: 3.

	"異常系検証（ログを出して安全にスキップされるか）"
	w remove: 5 coinsOfValue: 0.50s2.
	self assert: (w coinsOfValue: 0.50s2) equals: 3 "無傷！"
]

{ #category : 'tests' }
WalletTest >> testRemoveSeveralCoins [

	| w |
	w := Wallet new.

	"50円玉を5枚入れる"
	w add: 5 coinsOfValue: 0.50s2.

	"50円玉を『2枚』取り出す！"
	w remove: 2 coinsOfValue: 0.50s2.

	"アサート：5枚中2枚引いたので、残りは3枚のはず！"
	self assert: (w coinsOfValue: 0.50s2) equals: 3.

	"合計金額のアサート：0.50s2 * 3 = 1.50s2 のはず！"
	self assert: w money equals: 1.50s2
]

{ #category : 'tests' }
WalletTest >> testWalletAtCreationIsZero [

	| w |
	w := Wallet new.
	self assert: w money equals: 0
]
