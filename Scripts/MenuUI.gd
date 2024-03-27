extends Control


func move(target):
	var move_tween = get_node("Mmove_tween")
	move_tween.interpolate_property(self, "rect_position", rect_position, target,2,Tween.TRANS_EXPO, Tween.EASE_OUT)
	yield(get_tree().create_timer(1.6), "timeout")
	move_tween.start()
	

func _ready():
	pass 
