extends AnimationPlayer

func Setfade():
	self.current_animation = "button_fade";
	yield(get_tree().create_timer(2), "timeout")
	self.stop()
	

func _ready():
	pass 
