extends Control

signal feedButton
signal toiletButton
signal medicineButton

func _ready() -> void:
	print("UI loading...")
	$Feed.connect("pressed", _feed_pressed)
	$Toilet.connect("pressed", _toilet_pressed)
	$Medicine.connect("pressed", _medicine_pressed)
	$Debug.connect("pressed", _debug_pressed)
	print("UI Loaded.")
	


func _feed_pressed():
	feedButton.emit()

func _toilet_pressed():
	toiletButton.emit()

func _medicine_pressed():
	medicineButton.emit()

func _debug_pressed():
	if %Debug.visible == false:
		%Debug.visible = true
		%Debug.isDebug = true
	else:
		%Debug.visible = false
		%Debug.isDebug = false
