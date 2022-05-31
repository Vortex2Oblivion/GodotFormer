extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/MainScene.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/QuitConfirmScene.tscn")




func _on_OptionsButton_pressed() -> void:
	get_tree().change_scene("res://source/scenes/Options.tscn")
