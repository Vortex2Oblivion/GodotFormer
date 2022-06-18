extends KinematicBody2D
signal health_updated(health)
signal killed()
const bulletPath = preload("res://source/scenes/Bullet.tscn")
export var speed = 300 # How fast the player will move (pixels/sec).
var GRAVITY = 9 # in pixels
const JUMP = 25 # start speed px/s
const SPEED = 300 # px/s
export (float) var max_health = 100
onready var health = max_health
var velocity = Vector2.ZERO # (0,0)
export var fallspeed = Vector2(150.0, 350.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
onready var invulnerability_timer = $InvunerabilityTimer
const FLOOR_NORMAL = Vector2.UP
func _ready():
	pass
func _on_Timer_timeout():
	print(str($Timer.wait_time) + " second(s) finished")


var _velocity = Vector2.ZERO
func shoot():
	var bullet = bulletPath.instance()	
	get_parent().add_child(bullet)
	bullet.position = $Position2D.global_position
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

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		_set_health(health - amount)

func kill():
	pass

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")
		
