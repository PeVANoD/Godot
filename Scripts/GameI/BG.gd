extends ParallaxBackground

const scroll_speed = 100

func _ready():
	pass
	
	
func _process(delta):
	scroll_offset.x -= scroll_speed * delta
		
