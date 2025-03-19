extends Node

const base_weapon = {
	"warhammer" : {"type":"weapon","name":"warhammer","price":9,"dmg_dice":6,"dmg_bonus":0,"hit_bonus":0},
	"dagger" : {"type":"weapon","name":"dagger","price":6,"dmg_dice":4,"dmg_bonus":0,"hit_bonus":1},
	"sword" : {"type":"weapon","name":"sword","price":12,"dmg_dice":6,"dmg_bonus":0,"hit_bonus":1},
	"flail" : {"type":"weapon","name":"flail","price":15,"dmg_dice":6,"dmg_bonus":1,"hit_bonus":0}
}

const base_item = {
	"armor" : {"type":"permanent","name":"armor","price":10},
	"potion" : {"type":"consumable","name":"potion","price":4},
	"scroll" : {"type":"consumable","name":"scroll","price":7},
	"cloack" : {"type":"consumable","name":"cloack","price":15},
}

func roll(dice:int,bonus:int):
	print(str("Rolling D",dice,(str("+",bonus) if bonus != 0 else "")))
	var dice_roll = randi_range(1,dice)
	var total = dice_roll+bonus
	print(str("You rolled a ",total))
	return total
