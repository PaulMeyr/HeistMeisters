extends Node

export var length = 8


func _ready():
	generate_combo(length)


func generate_combo(length):
	var combination = []
	for number in range(length):
		randomize()
		combination.append(randi() % 10)
	print(combination)
