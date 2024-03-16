extends KinematicBody2D

onready var GCD = get_node("/root/SsGameChooseData")

const JUMP_VELOCITY = -320.0
const rot_speed = 200.0
const gravity = 700.0

var velocity: Vector2 = Vector2.ZERO
var flap = 0

func _ready():
	player_move(false)
	$AnimatedSprite.play("FlyII")
	pass

func Flap():
	if GCD.Paused == 0:
		flap = 1
	
func _process(delta):
	velocity.y += gravity * delta
	if rotation_degrees <= 40.0 and velocity.y > 0:
		rotation_degrees += rot_speed * delta/2.5
		if rotation_degrees <= 0.0:
			$AnimatedSprite.stop()
			$AnimatedSprite.frame = 0
	else:
		if rotation_degrees >= -15.0:
			rotation_degrees -= rot_speed * delta/0.8
	if (flap):
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite.play("FlyII")
		flap = 0
	
	
	position += velocity * delta
	
func player_move(value: bool) -> void:
	set_process(value)
	
