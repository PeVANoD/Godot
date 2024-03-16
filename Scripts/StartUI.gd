extends Control

func _ready():
	pass

func move(target, what, where, count, speed, how):
	var move_tween = get_node("Smove_tween")
	move_tween.interpolate_property(self, what, where, target, count ,speed, how)
	move_tween.start()
	
