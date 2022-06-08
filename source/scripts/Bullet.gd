extends Area2D
export (PackedScene) var Bullet
var speed = 750
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		var b = Bullet.instance()
		owner.add_child(b)
		b.transform = $Bullet.global_transform
