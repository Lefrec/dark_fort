extends Node2D

#Labels temporaires
@onready var roomLabel = $"../UI/RoomLabel"
@onready var eventLabel = $"../UI/EventLabel"

#Labels permanents
@onready var kargunt = $"../Kargunt"

var currentRoom : int :
	set(value):
		roomLabel.text = str("Room ",value)

var currentEvent : String :
	set(value):
		eventLabel.text = str(value)

var rooms : Array[Dictionary]

func generate_dungeon():
	currentRoom = 0
	rooms = [generate_entrance()]

func generate_entrance():
	var door_roll = Library.roll(4,0)
	var new_entrance = {
		"NB_door" = door_roll,
		"visited" = true,
		"explored" = false
	}
	match door_roll :
		1 : 
			Library.logs("You find a random item")
			new_entrance.event = "You find a random item"
		2 : 
			Library.logs("A WEAK MONSTER stands guards")
			new_entrance.event = "A WEAK MONSTER stands guards"
		3 : 
			Library.logs("A dying mystic gives you a random scroll")
			new_entrance.event = "A dying mystic gives you a random scroll"
		4 : 
			Library.logs("The entrance is eerily quiet and desolate")
			new_entrance.event = "The entrance is eerily quiet and desolate"
	return new_entrance
