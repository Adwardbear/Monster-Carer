extends Control

signal feedButton
signal toiletButton

func _ready() -> void:
	print("UI loading...")
	$Feed.connect("pressed", _feed_pressed)
	$Toilet.connect("pressed", _toilet_pressed)
	$Debug.connect("pressed", _debug_pressed)
	print("UI Loaded.")
	


func _feed_pressed():
	feedButton.emit()

func _toilet_pressed():
	toiletButton.emit()

func _debug_pressed():
	if %Debug.visible == false:
		%Debug.visible = true
	else:
		%Debug.visible = false
