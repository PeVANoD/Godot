extends CheckButton


func _ready():
	pass

func _on_SoundSet_toggled(button_toggled):
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(0.93, 0.93),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1, 1),0.08,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	
