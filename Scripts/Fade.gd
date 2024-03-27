extends AnimationPlayer

func Afade():
	self.current_animation = "text_fade";
	yield(get_tree().create_timer(2.8),"timeout")
	self.stop()

func _ready():
	pass 
