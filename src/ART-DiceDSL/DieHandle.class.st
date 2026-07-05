"
私は、プレイヤーが複数のサイコロを同時に振ることができるようにするための「ダイスハンドル（掴んだ複数のサイコロ）」を表すクラスです。

内部に Die インスタンスのコレクション（ OrderedCollection ）を保持し、新しいサイコロの追加、現在の合計個数の管理、およびハンドル全体のロール（サイコロを振る）挙動を制御するメソッドを提供します。

■ 公開APIと主要メッセージ:
- addDie: aDie  (ハンドルにサイコロを1個追加する)
- diceCount     (現在保持しているサイコロの総数を返す)
- roll          (ハンドル内のすべてのサイコロを振り、その合計値を返す)

■ 使用例（コードスニペット）:
| handle |
handle := DieHandle new
	addDie: (Die withFaces: 6);
	addDie: (Die withFaces: 10);
	yourself.
handle diceCount. "">>> 2""

■ インスタンス変数:
	dice: <OrderedCollection of Die>  サイコロのインスタンスを格納する可変長コレクション。
"
Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'ART-DiceDSL',
	#package : 'ART-DiceDSL'
}

{ #category : 'accessing' }
DieHandle >> + aDieHandle [

	| newHandle |
	newHandle := DieHandle new.
	self dice do: [ :each | newHandle addDie: each ].
	aDieHandle dice do: [ :each | newHandle addDie: each ].
	^ newHandle
]

{ #category : 'adding' }
DieHandle >> addDie: aDie [

	dice add: aDie
]

{ #category : 'accessing' }
DieHandle >> dice [

	^ dice
]

{ #category : 'accessing' }
DieHandle >> diceCount [

	^ dice size 
]

{ #category : 'initialization' }
DieHandle >> initialize [ 

	super initialize .
	dice := OrderedCollection new 
]

{ #category : 'rolling' }
DieHandle >> roll [

	^ dice sum: [ :each | each roll ]
]
