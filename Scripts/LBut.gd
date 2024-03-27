extends TextureButton



func _ready():
	pass

func _on_LBut_pressed():
	get_tree().get_root().get_node("Main/Audio/SwapGame").play()
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1.2, 1.2),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	
	var GCD = get_node("/root/SsGameChooseData")
	if (GCD.gameNum == 1):
		GCD.gameNum = 3
	else:
		GCD.gameNum -= 1
	
	yield(get_tree().create_timer(0.08), "timeout")
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch").switch_button_pressed()
	
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1.3, 1.3),0.08,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	
	print(GCD.gameNum)
