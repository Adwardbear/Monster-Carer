extends Control

signal feedButton

func _ready() -> void:
	print("UI loading...")
	$Feed.connect("pressed", _feed_pressed)
	$Debug.connect("pressed", _debug_pressed)
	print("UI Loaded.")
	


func _feed_pressed():
	feedButton.emit()

func _debug_pressed():
	if %Debug.visible == false:
		%Debug.visible = true
	else:
		%Debug.visible = false
