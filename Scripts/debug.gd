extends Control

func _ready() -> void:
	print("Debug loading...")
	%"Game Systems".uiUpdate.connect(_update)
	print("Debug loaded.")

func _update():
	$Age.text = "Age: " + str(%"Game Systems".age)
	$Hunger.text = "Hunger: " + str(%"Game Systems".hunger)
	$Toilet.text = "Toilet: " + str(%"Game Systems".toilet)
	$Sick.text = "Sickness: " + str(%"Game Systems".isSick)
	$CareMistakes.text = "Care Mistakes: " + str(%"Game Systems".careMistakes)
