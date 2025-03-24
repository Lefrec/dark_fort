extends Node2D

#Labels temporaires
@onready var roomLabel = $RoomLabel
@onready var eventLabel = $EventLabel

#Labels permanents
@onready var kargunt = $"../Kargunt"

var currentRoom : int :
	set(value):
		print(value)
		roomLabel.text = str("Room ",value)

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
			print("You find a random item")
			new_entrance.event = "You find a random item"
		2 : 
			print("A WEAK MONSTER stands guards")
			new_entrance.event = "A WEAK MONSTER stands guards"
		3 : 
			print("A dying mystic gives you a random scroll")
			new_entrance.event = "A dying mystic gives you a random scroll"
		4 : 
			print("The entrance is eerily quiet and desolate")
			new_entrance.event = "The entrance is eerily quiet and desolate"
	return new_entrance
