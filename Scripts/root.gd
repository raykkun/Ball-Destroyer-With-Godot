extends Node2D
var score = 0
var brick_count = 0

func _ready() -> void:
	brick_count = get_tree().get_nodes_in_group("brick").size()
	
	for brick in get_tree().get_nodes_in_group("brick"):
		brick.destroyed.connect(_on_brick_destroyed)
		
	update_score()
	
func update_score():
	$ScoreLabel.text ="Score: " + str(score)
	
func _on_brick_destroyed():
	score += 1
	update_score()
	
	brick_count -= 1
	
	if brick_count <= 0:
		$WinLabel.show()
		$Ball.set_physics_process(false)
		$Paddle.set_physics_process(false)
