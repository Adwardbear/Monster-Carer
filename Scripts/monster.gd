extends CharacterBody2D

@export var speed = 250.0
@export var jumpSpeed = -1200.0
@export var gravity = 4000.0
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
@export var walkTimeMin = 2.0
@export var walkTimeMax = 4.0
@export var jumpCooldownMin = 3.0
@export var jumpCooldownMax = 8.0

var direction = 1
var walkTimer = 0.0
var jumpTimer = 0.0


func _ready():
	print("Monster loading...")
	%"Game Systems".hungerAlert.connect(_hungerIcon)
	%"Game Systems".toiletAlert.connect(_toiletIcon)
	
	walkTimer = randf_range(walkTimeMin, walkTimeMax)
	jumpTimer = randf_range(jumpCooldownMin, jumpCooldownMax)
	print("Monster loaded.")

func _hungerIcon(hunger):
	match hunger:
		0:
			$Hunger.hide()
		1:
			$Hunger.show()
		2:
			$Hunger.show()
		3:
			$Hunger.show()

func _toiletIcon(toilet):
	if toilet == 5:
		$Toilet.show()
	else:
		$Toilet.hide()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	var target_velocity_x = float(direction) * speed 
	velocity.x = lerp(velocity.x, target_velocity_x, acceleration)
	walkTimer -= delta
	
	if walkTimer <= 0.0:
		direction *= -1
		walkTimer = randf_range(walkTimeMin, walkTimeMax)
	jumpTimer -= delta
	
	if is_on_floor() and jumpTimer <= 0.0:
		velocity.y = jumpSpeed
		jumpTimer = randf_range(jumpCooldownMin, jumpCooldownMax)
		
	move_and_slide()
