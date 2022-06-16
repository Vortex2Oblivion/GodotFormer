extends Control
func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/MainScene.tscn")
func _on_QuitButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/QuitConfirmScene.tscn")
func _on_OptionsButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/Options.tscn")
