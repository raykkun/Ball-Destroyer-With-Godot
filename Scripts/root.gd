extends Node2D
var score = 0
var brick_count = 0
var game_over = false

func _ready() -> void:
	brick_count = get_tree().get_nodes_in_group("brick").size()
	
	for brick in get_tree().get_nodes_in_group("brick"):
		brick.destroyed.connect(_on_brick_destroyed)
		
	update_score()

func _process(delta: float) -> void:
	if game_over:
			if Input.is_action_just_pressed("restart"):
				get_tree().reload_current_scene()
	
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


func _on_ball_ball_exited() -> void:
	game_over = true
	
	$LoseLabel.show()
	$PressSpace.show()
	$Ball.set_physics_process(false)
	$Paddle.set_physics_process(false)
	$Restart.hide()
	
	


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
