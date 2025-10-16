extends Node2D

var age: int = 0
var hunger: int = 0
var loo: int = 0
var sick: bool = false
var careMistakes: int = 0

signal uiUpdate
signal hungerUpdate

func _ready() -> void:
	print("Game Systems loading...")
	%UI.feedButton.connect(_feed)
	%HungerTimer.connect("timeout", _hunger_timeout)
	%AgeTimer.connect("timeout", _age_timeout)
	%HungerTimer.start()
	%AgeTimer.start()
	print("Game Systems loaded.")

func _feed():
	hunger = 0
	uiUpdate.emit()
	hungerUpdate.emit(hunger)

func _hunger_timeout():
	hunger += 1
	
	if hunger == 4:
		careMistakes += 1
	elif hunger > 9:
		careMistakes += 1
	
	uiUpdate.emit()
	hungerUpdate.emit(hunger)
	

func _age_timeout():
	age += 1
	uiUpdate.emit()
	#code for growing up or emit to monster
