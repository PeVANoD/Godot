extends ParallaxBackground

onready var GCD = get_node("/root/SsGameChooseData")

var scroll_speed

func _ready():
	pass
	
	
func _process(delta):
	if GCD.SoloHardMode:
		scroll_speed = 130
	else:
		scroll_speed = 100
	scroll_offset.x -= scroll_speed * delta
		
