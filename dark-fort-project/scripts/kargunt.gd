extends Node2D

@onready var HPLabel = $HPLabel
@onready var silverLabel = $SilverLabel


var max_HP := 15
var current_HP :int:
	set(value):
		if value <= 0:
			print("You are dead")
			value = 0
		HPLabel.text = str(value," / ",max_HP," HP")

var silver := 0:
	set(value):
		silverLabel.text = str(value, " Silver")


func _ready():
	spawn_kargunt()

func spawn_kargunt():
	current_HP = max_HP
	silver = 15 + Library.roll(6,0)
