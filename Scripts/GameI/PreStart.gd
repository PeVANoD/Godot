extends Control


func _ready():
	set_process(!is_processing())

onready var GCD = get_node("/root/SsGameChooseData")
var count = 0

func _on_PreNext_pressed():
	count += 1
	
	if (count == 1):
		First()
	
	if (GCD.playerCount > 1):
		ButCheck()
	
	

func First():
	var T1
	if GCD.playerCount == 1:
		T1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesSolo")
	else:
		T1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText1") 
	
	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	if GCD.playerCount == 1:
		get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2/HoldButts").visible = false
	
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = true
	
	GCD.First = 1
	
	get_node("PreNext").disabled = true
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(T1, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(T2.rect_position.x, -576), 0.5, Tween.TRANS_EXPO,Tween.EASE_IN)
	tween.start()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	tween.interpolate_property(T2, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.75,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	set_process(!is_processing())
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = false
	
	
	if GCD.playerCount == 1:
		Second()
	else:
		get_node("PreNext").disabled = false


func Second():

	var T2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText2")
	var C3 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount3")
	var C2 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount2")
	var C1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRCount1")
	
	
	
	get_node("PreNext").disabled = true
	var tween = Tween.new()
	add_child(tween)
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = true
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = false
	
	
	
	tween.interpolate_property(T2, "rect_position",Vector2(T2.rect_position.x,0),Vector2(T2.rect_position.x, -576), 0.5, Tween.TRANS_EXPO,Tween.EASE_IN)
	tween.start()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 1,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	tween.interpolate_property(C3, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(T2.rect_position.x+get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 1,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	tween.interpolate_property(C2, "rect_scale",Vector2(1, 1),Vector2(0, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(T2.rect_position.x+get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 1,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	tween.interpolate_property(C1, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(T2.rect_position.x+get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	yield(get_tree().create_timer(0.3), "timeout")
	
	self.visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = false
	
	
	yield(get_tree().create_timer(0.05), "timeout")
	
	BirdsFromPlayers()
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = true
	
	

func BirdsFromPlayers():
	if GCD.playerCount == 1:
		get_tree().get_root().get_node("Game1main/PlayerButs/butSolo").visible = true
		get_tree().get_root().get_node("Game1main/Game2D/Birds/Solo").player_move(true)
	if GCD.playerCount == 2:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
	if GCD.playerCount == 3:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").player_move(true)
	if GCD.playerCount == 4:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P4").player_move(true)
	


func _process(delta):
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = false

	if GCD.First == 1:
		ButCheck()


func ButCheck():
	if (GCD.playerCount == 2 and GCD.But1 == 1 and GCD.But2 == 1):
		set_process(!is_processing())
		GCD.First = 0
		OFF()
		Second()
	if (GCD.playerCount == 3 and GCD.But1 == 1 and GCD.But2 == 1 and GCD.But3 == 1):
		set_process(!is_processing())
		GCD.First = 0
		OFF()
		Second()
	if (GCD.playerCount == 4 and GCD.But1 == 1 and GCD.But2 == 1 and GCD.But3 == 1 and GCD.But4 == 1):
		set_process(!is_processing())
		GCD.First = 0
		OFF()
		Second()

func OFF():
	pass
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").show_behind_parent = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").show_behind_parent = false


func _on_but1_released():
	GCD.But1 = 0


func _on_but2_released():
	GCD.But2 = 0


func _on_but3_released():
	GCD.But3 = 0


func _on_but4_released():
	GCD.But4 = 0
