extends Node2D

#var bar_red = preload("res://assets/barHorizontal_red.png")
#var bar_green = preload("res://assets/barHorizontal_green.png")
#var bar_yellow = preload("res://assets/barHorizontal_yellow.png")

onready var healthbar = $HealthBar
func _ready():
	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health
