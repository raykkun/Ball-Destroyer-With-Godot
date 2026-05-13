extends CharacterBody2D

const SPEED : float = 600.0
var direction = Vector2.ZERO

func _ready() -> void:
	randomize_direction()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * SPEED * delta)
	
	if collision: 
		direction = direction.bounce(collision.get_normal()).normalized()
	
func randomize_direction():
	direction = Vector2(
		randf_range(-1.0, 1-0), -1
	).normalized()
	
