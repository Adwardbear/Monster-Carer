extends Node2D

var age: int = 0
var hunger: int = 0 #3 max
var toilet: int = 0 #5 triggers toilet
var isSick: bool = false
var careMistakes: int = 0

signal uiUpdate
signal hungerAlert
signal toiletAlert
signal sickAlert

func _ready() -> void:
	print("Game Systems loading...")
	%UI.feedButton.connect(_feed)
	%UI.toiletButton.connect(_poo)
	%UI.medicineButton.connect(_medicine)
	%HungerTimer.connect("timeout", _hunger_timeout)
	%AgeTimer.connect("timeout", _age_timeout)
	%ToiletTimer.connect("timeout", _toilet_timeout)
	%SickTimer.connect("timeout", _sick_timeout)
	%ToiletTimer.one_shot = true
	%SickTimer.one_shot = true
	%HungerTimer.start()
	%AgeTimer.start()
	print("Game Systems loaded.")

func _feed():
	#restart timer
	%HungerTimer.stop()
	%HungerTimer.start()
	
	#overfed limit
	if hunger > -5:
		hunger -= 1
	toilet += 1
	
	if hunger < -2:
		careMistakes += 1
		if !isSick:
			isSick = true
			%SickTimer.start()
			sickAlert.emit(isSick)
	
	
	if toilet == 5:
		toiletAlert.emit(toilet)
		%ToiletTimer.start()
	elif toilet > 5:
		%ToiletTimer.stop()
		_toilet_timeout()
	
	uiUpdate.emit()
	hungerAlert.emit(hunger)

func _hunger_timeout():
	#starving limit
	if hunger < 10:
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
	toiletAlert.emit(toilet)
	uiUpdate.emit()

func _toilet_timeout():
	toilet = 0
	careMistakes += 1
	uiUpdate.emit()
	toiletAlert.emit(toilet)

func _medicine():
	%SickTimer.stop()
	isSick = false
	uiUpdate.emit()
	sickAlert.emit(isSick)

func _sick_timeout():
	careMistakes += 5
	%SickTimer.start()
	uiUpdate.emit()
