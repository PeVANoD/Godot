extends Area2D

onready var GCD = get_node("/root/SsGameChooseData")

const JUMP_VELOCITY = -320.0
const rot_speed = 200.0
#const gravity = 700.0

const SPEED = -200.0

var velocity: Vector2 = Vector2.ZERO
var flap = 0

func _ready():
	player_move(false)
	#$AnimatedSprite.play("FlyIII")
	pass

func Flap():
	if GCD.Paused == 0:
		flap = 1
	
func _process(delta):
	if GCD.Alive3 == 1:
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
			$AnimatedSprite.play("FlyIII")
			flap = 0
		if (position.y <-10): 	
			GCD.Alive3 = 0
		if (position.y < 470): 
			position += velocity * delta
		else:
			GCD.Alive3 = 0
	else:
		if velocity.y < 0:
			velocity.y = 0
		if (position.y < 470): 
			velocity.y += gravity * delta
			position += velocity * delta
		position.x += SPEED * delta
	
func player_move(value: bool) -> void:
	set_process(value)
	

func Anim(smth):
	if smth:
		get_node("Anim").play("AB3")
	else:
		get_node("Anim").stop()


func _on_P3_body_entered(_body):
	GCD.Alive3 = 0
	self.set_collision_layer_bit(3, false)
	$AnimatedSprite.stop()
