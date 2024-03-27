extends Button

func _ready():
	pass


func _on_ChoosePlayers_pressed():	
	get_tree().get_root().get_node("Main/DevUI/DevCam/DevCamFix/DCButton").visible = false
	
	get_tree().get_root().get_node("Main/UI/StartUI").move(Vector2(0,60),"rect_position", Vector2(0,-576),2,Tween.TRANS_QUINT,Tween.EASE_OUT);
	get_tree().get_root().get_node("Main/UI/StartUI/GameTitle/AnimationPlayer").play();
	get_tree().get_root().get_node("Main/Audio/Move").play()
	yield(get_tree().create_timer(0.3), "timeout")
	#get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/TOffTexture/TOff").play("TOff")
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().get_root().get_node("Main/UI/StartUI").move(Vector2(60, 60), "rect_scale",self.rect_scale,1,Tween.TRANS_QUINT,Tween.EASE_IN);
	get_tree().get_root().get_node("Main/UI/StartUI").move(Vector2(-23000,-12000),"rect_position", Vector2(0,60),1,Tween.TRANS_QUINT,Tween.EASE_IN);
	get_tree().get_root().get_node("Main/Audio/Zoom").play()
	yield(get_tree().create_timer(2), "timeout")
	
	var _Fix = get_tree().change_scene("res://Scenes/PlayerCount.tscn")

