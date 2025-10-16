extends Control

var isDebug: bool = false

func _ready() -> void:
	print("Debug loading...")
	$DebugTimer.start()
	%"Game Systems".uiUpdate.connect(_update)
	$DebugTimer.connect("timeout", _update)
	print("Debug loaded.")

func _update():
	%Age.text = "Age: " + str(%"Game Systems".age)
	%Hunger.text = "Hunger: " + str(%"Game Systems".hunger)
	%Toilet.text = "Toilet: " + str(%"Game Systems".toilet)
	%Sick.text = "Sickness: " + str(%"Game Systems".isSick)
	%CareMistakes.text = "Care Mistakes: " + str(%"Game Systems".careMistakes)
	
	$Timers/Age.text = str(int(%"Game Systems"/AgeTimer.time_left))
	$Timers/Hunger.text = str(int(%"Game Systems"/HungerTimer.time_left))
	$Timers/Toilet.text = str(int(%"Game Systems"/ToiletTimer.time_left))
	$Timers/Sick.text = str(int(%"Game Systems"/SickTimer.time_left))
