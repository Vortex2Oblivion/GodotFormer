extends KinematicBody2D
#var bullet = preload("res://Bullet.tscn")

export var speed = 300 # How fast the player will move (pixels/sec).
const GRAVITY = 5 # in pixels
const JUMP = 25 # start speed px/s
const SPEED = 300 # px/s
var health = 100
var velocity = Vector2.ZERO # (0,0)
func _ready():
	pass
func _process(delta):
	$ProgressBar.value = health
func _on_Timer_timeout():
	print(str($Timer.wait_time) + " second(s) finished")

export var fallspeed = Vector2(150.0, 350.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const FLOOR_NORMAL = Vector2.UP

var _velocity = Vector2.ZERO

# _physics_process is called after the inherited _physics_process function.
# This allows the Player and Enemy scenes to be affected by gravity.
func _physics_process(delta):
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity)


#	if Input.is_action_pressed("shoot"):
#		var bul = bullet.instance()
#		owner.add_child(bul)
#		bul.global_position = global_position
