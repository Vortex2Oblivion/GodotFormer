extends KinematicBody2D
const bulletPath = preload("res://source/scenes/Bullet.tscn")

export var speed = 300 # How fast the player will move (pixels/sec).
var GRAVITY = 9 # in pixels
const JUMP = 25 # start speed px/s
const SPEED = 300 # px/s
var health = 100
var velocity = Vector2.ZERO # (0,0)
func _ready():
	pass
func _on_Timer_timeout():
	print(str($Timer.wait_time) + " second(s) finished")

export var fallspeed = Vector2(150.0, 350.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const FLOOR_NORMAL = Vector2.UP
func _process(delta):
	$ProgressBar.value = health
var _velocity = Vector2.ZERO
func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	bullet.position = $Position2D.global_position
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
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("togglegravity"):
		GRAVITY = 0
	else:
		GRAVITY = 9
		
