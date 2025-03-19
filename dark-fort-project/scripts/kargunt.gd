extends Node2D

@onready var HPLabel = $HPLabel
@onready var silverLabel = $SilverLabel
@onready var inventoryLabel = $InventoryLabel

var max_HP := 15
var current_HP :int:
	set(value):
		if value <= 0:
			print("You are dead")
			value = 0
		elif value > max_HP:
				value = max_HP
		HPLabel.text = str(value," / ",max_HP," HP")
var silver := 0:
	set(value):
		silverLabel.text = str(value, " Silver")
var inventory : Array[Dictionary]

func _ready():
	spawn_kargunt()

func spawn_kargunt():
	#defining base stats
	current_HP = max_HP
	silver = 15 + Library.roll(6,0)
	#rolling for starting weapon
	match Library.roll(4,0) :
		1 : loot(Library.base_weapon.warhammer)
		2 : loot(Library.base_weapon.dagger)
		3 : loot(Library.base_weapon.sword)
		4 : loot(Library.base_weapon.flail)
	#rolling for starting item
	match Library.roll(4,0) :
		1 : loot(Library.base_item.armor)
		2 : loot(Library.base_item.potion)
		3 : loot(Library.base_item.scroll)
		4 : loot(Library.base_item.cloack)
	

func loot(item:Dictionary):
	#Checking if the item is correctly defined with every key needed
	if (item.has("type") and item.has("name") and item.has("price")):
		if item.type == "weapon" :
			if (item.has("dmg_dice") and item.has("dmg_bonus") and item.has("hit_bonus")):
				print(item.name+" is a valid weapon, adding it to your inventory")
				inventory.push_back(item)
				inventoryLabel.text = str(inventory.map(func(item): return item.name))
			else :
				print(item.name+" is not a valid weapon, dmg_dice, dmg_bonus or hit_bonus is not defined !")
		else :
			print(item.name+" is a valid item, adding it to your inventory")
			inventory.push_back(item)
			inventoryLabel.text = str(inventory.map(func(item): return item.name))
	else :
		print("This item is not valid, type, name or price is not defined !")
