extends AcceptDialog
func _ready():
	pass

#func _process(delta):
#   # Called every frame. Delta is time since last frame.
#   # Update game logic here.
#   pass

func _on_AcceptDialog_confirmed():
	get_node("..").quit = true 
