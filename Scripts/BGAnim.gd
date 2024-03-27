extends AnimationPlayer

func BGAnim():
	self.current_animation = "BGAnim"
	yield(get_tree().create_timer(1.7), "timeout");
	get_tree().get_root().get_node("Main/UI/StartUI/GameTitle/AnimationPlayer").stop();
	yield(get_tree().create_timer(0.8), "timeout");
	get_tree().get_root().get_node("Main/Background").color = Color("4c72ab")
	self.stop()
		


func _ready():
	pass 
