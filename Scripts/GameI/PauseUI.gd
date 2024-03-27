extends Control

onready var saveData = SaveFile.gData

func _ready():
	set_process(!is_processing())

onready var GCD = get_node("/root/SsGameChooseData")

var Zero1 = preload("res://Scripts/GameI/Flaps/P1.gd")
var Zero2 = preload("res://Scripts/GameI/Flaps/P2.gd")
var Zero3 = preload("res://Scripts/GameI/Flaps/P3.gd")
var Zero4 = preload("res://Scripts/GameI/Flaps/P4.gd")

func Paused():
	ButPause()
	
	GCD.Paused = 1
	
	set_process(!is_processing())
	
	if (!(GCD.AreWeAlive)) and GCD.playerCount != 1:
		set_process(1)
		End()
		return
	else:
		get_tree().paused = true
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = false
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = true
	
	
	
	if (GCD.AreWeAlive):
		var tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(self, "rect_scale",Vector2(0.05, 0.05),Vector2(1, 1),0.1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
	else:
		self.rect_scale = Vector2(1, 1)
	
	
	
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = true


func UnPaused():
	self.rect_scale = Vector2(0,0)
	
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = true
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").pressed = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").pressed = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").pressed = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").pressed = false
	
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	
	if GCD.playerCount == 1:
		get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2/HoldButts").visible = false
	if GCD.playerCount != 1:
		T2.rect_position = Vector2(T2.rect_position.x, 0)
		T2.rect_scale = Vector2(1,1)
		
	
	if GCD.Alive1:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = false
	else:
		GCD.But1 = 1
	
	if GCD.Alive2:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = false
	else:
		GCD.But2 = 1
	
	if GCD.Alive3:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = false
	else:
		GCD.But3 = 1
	
	if GCD.Alive4:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = false
	else:
		GCD.But4 = 1
	
	
	if GCD.playerCount == 1:
		PauseEnd()
	else:
		set_process(1)
		get_tree().get_root().get_node("Game1main/Audio/Game/GetReady").play()
	
	
func _process(_delta):
	if GCD.First == 1:
		if GCD.Alive1:
			get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = false
		if GCD.Alive2:
			get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = false
		if GCD.Alive3:
			get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = false
		if GCD.Alive4:
			get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = false
		ButCheck()


func ButCheck():
	if (GCD.playerCount == 2 and GCD.But1 == 1 and GCD.But2 == 1):
		set_process(!is_processing())
		GCD.First = 0
		Second()
	if (GCD.playerCount == 3 and GCD.But1 == 1 and GCD.But2 == 1 and GCD.But3 == 1):
		set_process(!is_processing())
		GCD.First = 0
		Second()
	if (GCD.playerCount == 4 and GCD.But1 == 1 and GCD.But2 == 1 and GCD.But3 == 1 and GCD.But4 == 1):
		set_process(!is_processing())
		GCD.First = 0
		Second()


func Second():
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	var C3 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount3")
	var C2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount2")
	var C1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount1")
	
	
	GCD.Paused = 0
	GCD.First = 0
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = true
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = false
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = true
	
	
	var tween = Tween.new()
	add_child(tween)

	if !GCD.Paused:
		tween.interpolate_property(T2, "rect_position",Vector2(T2.rect_position.x,0),Vector2(T2.rect_position.x, -576), 0.5, Tween.TRANS_EXPO,Tween.EASE_IN)
		tween.start()
	else:
		return
		
	if !GCD.Paused:
		yield(get_tree().create_timer(0.5), "timeout")
		tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	else:
		tween.stop_all()
		return
	
	if !GCD.Paused:
		yield(get_tree().create_timer(0.35), "timeout")
		tween.interpolate_property(C3, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	else:
		tween.stop_all()
		return

	if !GCD.Paused:
		yield(get_tree().create_timer(0.35), "timeout")
		tween.interpolate_property(C2, "rect_scale",Vector2(1, 1),Vector2(0, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	else:
		tween.stop_all()
		return

	if !GCD.Paused:
		yield(get_tree().create_timer(0.35), "timeout")
		tween.interpolate_property(C1, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
	else:
		tween.stop_all()
		return
		
	yield(get_tree().create_timer(0.3), "timeout")
	
	if !GCD.Paused:
		get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = false
		get_tree().paused = false
		get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = false
		tween.stop_all()
	else:
		tween.stop_all()
		return
	
	
	if GCD.Alive1:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = false
	else:
		GCD.But1 = 1
	
	if GCD.Alive2:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = false
	else:
		GCD.But2 = 1
	
	if GCD.Alive3:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = false
	else:
		GCD.But3 = 1
	
	if GCD.Alive4:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = false
	else:
		GCD.But4 = 1
	

func PauseEnd():
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = false
	get_tree().paused = false
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = false


func _on_Resume_pressed():
	get_tree().get_root().get_node("Game1main/Audio/Game/Sel1").play()
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	var C3 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount3")
	var C2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount2")
	var C1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount1")
	
	T2.rect_position = Vector2(T2.rect_position.x, 576)
	C3.rect_position = Vector2(0, 576)
	C2.rect_position = Vector2(0, 576)
	C1.rect_position = Vector2(0, 576)
	C3.rect_scale = Vector2(1,1)
	C2.rect_scale = Vector2(1,1)
	C1.rect_scale = Vector2(1,1)
	T2.visible = true
	C3.visible = true
	C2.visible = true
	C1.visible = true
	
	GCD.First = 1
	moveBut("Resume")
	yield(get_tree().create_timer(0.2), "timeout")
	
	
	UnPaused()

func _on_Restart_pressed():
	get_tree().get_root().get_node("Game1main/Audio/Game/Sel1").play()
	moveBut("Restart")
	GCD.Restart = 1
	yield(get_tree().create_timer(0.2), "timeout")
	
	#VisCount()
	GCD.Alive1 = 1
	GCD.Alive2 = 1
	GCD.Alive3 = 1
	GCD.Alive4 = 1
	GCD.AliveS = 1
	GCD.Winner = 0
	
	GCD.But1 = 0
	GCD.But2 = 0
	GCD.But3 = 0
	GCD.But4 = 0
	
	
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").show_behind_parent = true
	GCD.Paused = 0
	get_tree().paused = false
	var _Fix = get_tree().change_scene("res://Scenes/Game1.tscn")



func _on_Quit_pressed():
	GCD.SoloHardMode = 0
	if !saveData.Sound:
		saveData.Sound = 2
	get_tree().get_root().get_node("Game1main/Audio/Game/Sel1").play()
	moveBut("Quit")
	yield(get_tree().create_timer(0.2), "timeout")
	
	#VisCount()
	
	GCD.Alive1 = 1
	GCD.Alive2 = 1
	GCD.Alive3 = 1
	GCD.Alive4 = 1
	GCD.AliveS = 1
	GCD.Winner = 0
	
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").show_behind_parent = true
	GCD.Paused = 0
	get_tree().paused = false
	var _Fix = get_tree().change_scene("res://Scenes/StartUI.tscn")


func ButPause():
	GCD.First = 0
	var But = get_tree().get_root().get_node("Game1main/PlayerButs/Pause")
	if (GCD.AreWeAlive):
		But.show_behind_parent = false
	
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	var C3 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount3")
	var C2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount2")
	var C1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount1")
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = true
	
	
	T2.rect_position = Vector2(T2.rect_position.x, 576)
	T2.visible = false
	C3.visible = false
	C2.visible = false
	C1.visible = false
	
	GCD.But1 = 0
	GCD.But2 = 0
	GCD.But3 = 0
	GCD.But4 = 0
	
	
	set_process(!is_processing())
	
	if (GCD.AreWeAlive):
		var tweenI = Tween.new()
		add_child(tweenI)
		tweenI.interpolate_property(But, "rect_scale",Vector2(1, 1),Vector2(0.9, 0.9),0.2,Tween.TRANS_QUAD,Tween.EASE_OUT)
		tweenI.start()
		
		yield(get_tree().create_timer(0.1), "timeout")
		
		tweenI.interpolate_property(But, "rect_scale",Vector2(0.9, 0.9),Vector2(1, 1),0.2,Tween.TRANS_QUAD,Tween.EASE_IN)
		tweenI.start()
	
	
func moveBut(but):
	var Resume = get_tree().get_root().get_node("Game1main/PlayerButs/PauseUI/CenterContainer/VBoxContainer/" + but)
	
	var tween = Tween.new()
	add_child(tween)

	tween.interpolate_property(Resume, "rect_scale",Vector2(1,1),Vector2(1.1,1.1), 0.1, Tween.TRANS_EXPO,Tween.EASE_IN)
	tween.start()

	yield(get_tree().create_timer(0.1), "timeout")

	tween.interpolate_property(Resume, "rect_scale",Vector2(1.1,1.1),Vector2(1,1), 0.1,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()

func VisCount():
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	var C3 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount3")
	var C2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount2")
	var C1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount1")
	T2.rect_position = Vector2(T2.rect_position.x, 576)
	T2.visible = false
	C3.visible = false
	C2.visible = false
	C1.visible = false

func End():
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2").visible = true
	get_node("CenterContainer/VBoxContainer/Resume").visible = false
	get_node("CenterContainer/VBoxContainer").visible = false
	get_tree().get_root().get_node("Game1main/EndScreen").visible = true
	get_tree().get_root().get_node("Game1main/EndScreen").End()
