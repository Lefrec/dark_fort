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
	rooms = [generate_entrance()]
	currentRoom = 0

func generate_entrance():
	var door_roll = Library.roll(4,0)
	var new_entrance = {
		"NBDoor" = door_roll,
		"neighbor" = [],
		"visited" = true,
		"explored" = false
	}
	match door_roll :
		1 : 
			new_entrance.event = "You find a random item"
		2 : 
			new_entrance.event = "A WEAK MONSTER stands guards"
		3 : 
			new_entrance.event = "A dying mystic gives you a random scroll"
		4 : 
			new_entrance.event = "The entrance is eerily quiet and desolate"
	Library.logs(new_entrance.event)
	return new_entrance

func generate_room():
		1 :
			door_roll = 0
		2,3 :
			door_roll = 1
		4 :
			door_roll = 2
	var new_room = {
		"neighbor" = [currentRoom],
		"visited" = true,
		"explored" = false
	}
