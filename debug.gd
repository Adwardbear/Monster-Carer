extends Control

func _ready() -> void:
	print("Debug loading...")
	%"Game Systems".uiUpdate.connect(_update)
	print("Debug loaded.")

func _update():
	$Age.text = "Age: " + str(%"Game Systems".age)
	$Food.text = "Food: " + str(%"Game Systems".hunger)
	#$Poo.text = str("Loo: " + %"Game Systems".loo)
	#$Sick.text = str("Sick: " + %"Game Systems".sick)
	$Sick2.text = "Care Mistakes: " + str(%"Game Systems".careMistakes)
