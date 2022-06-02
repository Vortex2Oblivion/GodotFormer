extends KinematicBody2D
var bullet = preload("res://source/scenes/Bullet.tscn")

export var speed = 300 # How fast the player will move (pixels/sec).
const GRAVITY = 10 # in pixels
const JUMP = 25 # start speed px/s
const SPEED = 300 # px/s
var velocity = Vector2.ZERO # (0,0)
func _ready():
	pass
func _on_Timer_timeout():
	print(str($Timer.wait_time) + " second(s) finished")

export var fallspeed = Vector2(150.0, 350.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const FLOOR_NORMAL = Vector2.UP

var _velocity = Vector2.ZERO

# _physics_process is called after the inherited _physics_process function.
# This allows the Player and Enemy scenes to be affected by gravity.
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	velocity.y += GRAVITY
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	velocity = move_and_slide(velocity)
	if Input.is_action_pressed("shoot"):
		var bul = bullet.instance()
		owner.add_child(bul)
		bul.global_position = global_position
