extends KinematicBody2D
export (PackedScene) var Bullet
var velocity = Vector2(2, 0)
var speed = 650

func _physics_process(delta):
	var colision_info = move_and_collide(velocity.normalized() * delta * speed)
