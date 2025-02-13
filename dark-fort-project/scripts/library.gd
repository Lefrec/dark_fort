extends Node


func roll(dice:int,bonus:int):
	print(str("Rolling D",dice,(str("+",bonus) if bonus != 0 else "")))
	var dice_roll = randi_range(1,dice)
	var total = dice_roll+bonus
	print(str("You rolled a ",total))
	return total
