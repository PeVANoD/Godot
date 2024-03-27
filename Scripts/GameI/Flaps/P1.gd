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
	#$AnimatedSprite.play("FlyI")
	pass

func Flap():
	if GCD.Paused == 0:
		flap = 1
	
func _process(delta):
	if GCD.Alive1 == 1:
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
			get_tree().get_root().get_node("Game1main/Audio/Flap/Flap1").play()
			velocity.y = JUMP_VELOCITY
			$AnimatedSprite.play("FlyI")
			flap = 0
		if (position.y <-10): 	
			GCD.Alive1 = 0
		if (position.y < 470): 
			position += velocity * delta
		else:
			GCD.Alive1 = 0
			if self.visible:
				get_tree().get_root().get_node("Game1main/Audio/Flap/Bump1").play()
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
		get_node("Anim").play("AB1")
	else:
		get_node("Anim").stop()





func _on_P1_body_entered(_body):
	if self.visible:
		get_tree().get_root().get_node("Game1main/Audio/Flap/Bump1").play()
	GCD.Alive1 = 0
	self.set_collision_layer_bit(1, false)
	$AnimatedSprite.stop()
