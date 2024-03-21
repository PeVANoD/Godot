extends CheckButton


func _ready():
	pass

func _on_InfoBut_toggled(button_toggled):
	var InfoPannel = get_tree().get_root().get_node("Main/UI/MenuUI/InfoPop")
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(0.93, 0.93),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1, 1),0.08,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()

	var tweenI = Tween.new()
	add_child(tweenI)
	if (button_toggled):
		tweenI.interpolate_property(InfoPannel, "rect_scale",Vector2(InfoPannel.rect_scale.x, InfoPannel.rect_scale.y),Vector2(1, 1),0.5,Tween.TRANS_BACK,Tween.EASE_OUT)
		tweenI.start()
		self.disabled = true
		AllButsOff(1)
		#yield(get_tree().create_timer(0.4), "timeout")
		self.disabled = false
	if (!(button_toggled)):
		tweenI.interpolate_property(InfoPannel, "rect_scale",Vector2(InfoPannel.rect_scale.x, InfoPannel.rect_scale.y),Vector2(0, 0),0.5,Tween.TRANS_QUINT,Tween.EASE_OUT)
		tweenI.start()
		self.disabled = true
		#yield(get_tree().create_timer(0.4), "timeout")
		self.disabled = false
		AllButsOff(0)
		








func AllButsOff(num):
	if (num):
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/RBut").disabled = true
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/LBut").disabled = true
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/ChoosePlayers").disabled = true
		get_tree().get_root().get_node("Main/UI/MenuUI/GameList").disabled = true
		get_tree().get_root().get_node("Main/UI/MenuUI/SoundSet").disabled = true
	else:
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/RBut").disabled = false
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/LBut").disabled = false
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/ChoosePlayers").disabled = false
		get_tree().get_root().get_node("Main/UI/MenuUI/GameList").disabled = false
		get_tree().get_root().get_node("Main/UI/MenuUI/SoundSet").disabled = false
	
