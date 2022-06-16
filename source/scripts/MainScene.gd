extends Node2D
const ENEMY_FOLLOW_SPEED = 0.5
var speed = 350
func _physics_process(delta):
	var player_pos = $Player.get_position()
	var gotoplayer = $Player.get_position()
	var hp
	$Enemy.position = $Enemy.position.linear_interpolate(player_pos, delta * ENEMY_FOLLOW_SPEED)
	if Input.is_action_pressed("exit_to_title"):
		get_tree().change_scene("res://source/scenes/PauseMenu.tscn")
