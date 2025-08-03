extends Node2D

var coin_count: int = 0

func _ready():
	update_coin_label()

func collect_coin():
	coin_count += 1
	update_coin_label()

func update_coin_label():
	$CanvasLayer/CoinLabel.text = "Coins: $coin_count"
