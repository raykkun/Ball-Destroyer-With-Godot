extends CharacterBody2D

var SPEED : float = 600.0

func _physics_process(delta: float) -> void:
	var direction = 0
	
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1
	
	velocity.y = 0
	velocity.x = direction * SPEED
	move_and_slide()
