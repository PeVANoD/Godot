extends Control

onready var saveData = SaveFile.gData
onready var GCD = get_node("/root/SsGameChooseData")

func _ready():
	var HighScore = get_node("PreRulesSolo/HighScore")
	if GCD.SoloHardMode:
		HighScore.text = "Highscore:\n    %s" % [saveData.Game1SoloHardScore]
	else:
		HighScore.text = "Highscore:\n    %s" % [saveData.Game1SoloScore]
	set_process(!is_processing())

var count = 0

func _on_PreNext_pressed():
	count += 1
	
	if (count == 1):
		First()
	
	if (GCD.playerCount > 1):
		ButCheck()
	
	

func First():
	KillSomeBirds()
	
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
	get_tree().get_root().get_node("Game1main/Audio/Game/GetReady").play()
	yield(get_tree().create_timer(0.5), "timeout")
	
	if GCD.playerCount == 1:
		tween.interpolate_property(T2, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.5,Tween.TRANS_EXPO, Tween.EASE_OUT)
		tween.start()
		set_process(!is_processing())
		yield(get_tree().create_timer(0.3), "timeout")
	else:
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
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = true
	
	
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
	
	tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	yield(get_tree().create_timer(0.35), "timeout")
	
	tween.interpolate_property(C3, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C3, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(T2.get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	yield(get_tree().create_timer(0.35), "timeout")
	
	tween.interpolate_property(C2, "rect_scale",Vector2(1, 1),Vector2(0, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C2, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 576),Vector2(T2.rect_position.x, 0), 0.8,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	get_tree().get_root().get_node("Game1main/Audio/Game/Countdown").play()
	yield(get_tree().create_timer(0.35), "timeout")
	
	tween.interpolate_property(C1, "rect_scale",Vector2(1, 1),Vector2(0, 0),  0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	tween.interpolate_property(C1, "rect_position",Vector2(T2.rect_position.x, 0),Vector2(get_viewport_rect().size.x/2, 0), 0.4,Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	
	get_tree().get_root().get_node("Game1main/Game2D/Birds/BReady").stop()
	
	yield(get_tree().create_timer(0.1), "timeout")
	
	self.visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = false
	
	AnimStop()
	
	yield(get_tree().create_timer(0.1), "timeout")
	
	
	BirdsFromPlayers()
	
	get_tree().get_root().get_node("Game1main/Game2D/BG/pipeSpawn/Timer").start()
	
	ScoreVisible()
	
	get_tree().get_root().get_node("Game1main/Game2D/BG/pipeSpawn")._on_Timer_timeout()
	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = false
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = false

	
	get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = true
	
	var numsi
	
	randomize()
	
	if GCD.SoloHardMode:
		numsi = ((randi() % 3)+5)
	else:
		numsi = ((randi() % 3)+1)
	
	Music(numsi)
	


func Music(num):
	if num == 1:
		print("1")
		get_tree().get_root().get_node("Game1main/Audio/Songs/1").play()
	if num == 2:
		print("2")
		get_tree().get_root().get_node("Game1main/Audio/Songs/2").play()
	if num == 3:
		print("3")
		get_tree().get_root().get_node("Game1main/Audio/Songs/3").play()
	if num == 4:
		print("4")
		get_tree().get_root().get_node("Game1main/Audio/Songs/4").play()
	if num == 5:
		print("5")
		get_tree().get_root().get_node("Game1main/Audio/Songs/5").play()
	if num == 6:
		print("6")
		get_tree().get_root().get_node("Game1main/Audio/Songs/6").play()
	if num == 7:
		print("7")
		get_tree().get_root().get_node("Game1main/Audio/Songs/7").play()
	if num == 8:
		print("8")
		get_tree().get_root().get_node("Game1main/Audio/Songs/8").play()

func BirdsFromPlayers():
	if GCD.playerCount == 1:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/Solo").Flap()
		get_tree().get_root().get_node("Game1main/PlayerButs/butSolo").visible = true
		get_tree().get_root().get_node("Game1main/Game2D/Birds/Solo").player_move(true)
		GCD.ScSolo = 0
	if GCD.playerCount == 2:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
		GCD.ScP1 = 0
		GCD.ScP2 = 0
	if GCD.playerCount == 3:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").player_move(true)
		GCD.ScP1 = 0
		GCD.ScP2 = 0
		GCD.ScP3 = 0
	if GCD.playerCount == 4:
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").player_move(true)
		get_tree().get_root().get_node("Game1main/Game2D/Birds/P4").player_move(true)
		GCD.ScP1 = 0
		GCD.ScP2 = 0
		GCD.ScP3 = 0
		GCD.ScP4 = 0


func _process(_delta):
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
	if GCD.Alive1 == 1:
		GCD.But1 = 0


func _on_but2_released():
	if GCD.Alive2 == 1:
		GCD.But2 = 0


func _on_but3_released():
	if GCD.Alive3 == 1:
		GCD.But3 = 0


func _on_but4_released():
	if GCD.Alive4 == 1:
		GCD.But4 = 0

func AnimStop():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").Anim(0)
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").Anim(0)
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").Anim(0)
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P4").Anim(0)
	
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P1/AnimatedSprite").frame = 0
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P2/AnimatedSprite").frame = 0
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P3/AnimatedSprite").frame = 0
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P4/AnimatedSprite").frame = 0
	
func ScoreVisible():
	if GCD.playerCount == 1:
		get_tree().get_root().get_node("Game1main/Scores/ScoreSolo").visible = true
	if GCD.playerCount == 2:
		get_tree().get_root().get_node("Game1main/Scores/ScoreP1").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP2").visible = true
	if GCD.playerCount == 3:
		get_tree().get_root().get_node("Game1main/Scores/ScoreP1").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP2").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP3").visible = true
	if GCD.playerCount == 4:
		get_tree().get_root().get_node("Game1main/Scores/ScoreP1").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP2").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP3").visible = true
		get_tree().get_root().get_node("Game1main/Scores/ScoreP4").visible = true


func KillSomeBirds():
	if GCD.playerCount == 1:
		GCD.Alive1 = 0
		GCD.Alive2 = 0
		GCD.Alive3 = 0
		GCD.Alive4 = 0
	if GCD.playerCount == 2:
		GCD.Alive3 = 0
		GCD.Alive4 = 0
		GCD.AliveS = 0
	if GCD.playerCount == 3:
		GCD.Alive4 = 0
		GCD.AliveS = 0
	if GCD.playerCount == 4:
		GCD.AliveS = 0
