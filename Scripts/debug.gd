extends Control

func _ready() -> void:
	print("Debug loading...")
	%"Game Systems".uiUpdate.connect(_update)
	print("Debug loaded.")

func _update():
	$Age.text = "Age: " + str(%"Game Systems".age)
	$Hunger.text = "Food: " + str(%"Game Systems".hunger)
	$Toilet.text = "Toilet: " + str(%"Game Systems".toilet)
	#$Sick.text = str("Sick: " + %"Game Systems".sick)
	$CareMistakes.text = "Care Mistakes: " + str(%"Game Systems".careMistakes)
