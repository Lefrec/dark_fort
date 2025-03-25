extends Node

@onready var logsRichText = get_node("/root/Main/UI/LogsRichText")


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

const random_item = {
	"potion" : {"type":"consumable","name":"potion","price":4},
	"rope" : {"type":"permanent","name":"rope","price":5},
	"scroll" : {"type":"consumable","name":"scroll","price":7},
	"armor" : {"type":"permanent","name":"armor","price":10},
	"cloack" : {"type":"consumable","name":"cloack","price":15},
}

func roll(dice:int,bonus:int):
	logs(str("[font_size={15}]Rolling [b]D",dice,(str("+",bonus) if bonus != 0 else ""),"[/b][/font_size]"))
	var dice_roll = randi_range(1,dice)
	var total = dice_roll+bonus
	logs(str("[font_size={15}]You rolled a [b]",total,"[/b][/font_size]"))
	return total

func logs(text : String):
	logsRichText.append_text(text + "\n")
