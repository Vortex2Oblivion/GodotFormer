extends Label

onready var game = $"../../"

func _process(_delta):
	text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	text += "\nMEM: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC) / 100000) / 10) + " MB"
