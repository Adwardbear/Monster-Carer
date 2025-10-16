extends Node2D

var age: int = 0
var hunger: int = 0
var toilet: int = 0
var sick: bool = false
var careMistakes: int = 0

signal uiUpdate
signal hungerAlert
signal toiletAlert

func _ready() -> void:
	print("Game Systems loading...")
	%UI.feedButton.connect(_feed)
	%UI.toiletButton.connect(_poo)
	%HungerTimer.connect("timeout", _hunger_timeout)
	%AgeTimer.connect("timeout", _age_timeout)
	%ToiletTimer.connect("timeout", _toilet_timeout)
	%ToiletTimer.one_shot = true
	%HungerTimer.start()
	%AgeTimer.start()
	print("Game Systems loaded.")

func _feed():
	hunger = 0
	toilet += 1
	
	if toilet == 5:
		toiletAlert.emit(toilet)
		%ToiletTimer.start()
	elif toilet > 5:
		%ToiletTimer.stop()
		_toilet_timeout()
	
	uiUpdate.emit()
	hungerAlert.emit(hunger)

func _hunger_timeout():
	hunger += 1
	
	if hunger == 4:
		careMistakes += 1
	elif hunger > 9:
		careMistakes += 1
	
	uiUpdate.emit()
	hungerAlert.emit(hunger)

func _age_timeout():
	age += 1
	uiUpdate.emit()
	#code for growing up or emit to monster

func _poo():
	toilet = 0
	%ToiletTimer.stop()
	uiUpdate.emit()

func _toilet_timeout():
	toilet = 0
	careMistakes += 1
	uiUpdate.emit()
	toiletAlert.emit(toilet)
