extends Control

onready var EndL = get_node("GameOver")
onready var Win = get_node("Winner!")

onready var GScore = get_tree().get_root().get_node("Game1main/Scores")
onready var SScore = get_node("VBoxContainer/ScoreSet2/SoloScore")
onready var NewHS = get_node("VBoxContainer/ScoreSet1/NewHS")
onready var HScore = get_node("VBoxContainer/ScoreSet3/HighScore")
onready var wAnim = get_node("Winner!/WinAnim")

onready var B1 = get_tree().get_root().get_node("Game1main/PlayerButs/butt1")
onready var B2 = get_tree().get_root().get_node("Game1main/PlayerButs/butt2")
onready var B3 = get_tree().get_root().get_node("Game1main/PlayerButs/butt3")
onready var B4 = get_tree().get_root().get_node("Game1main/PlayerButs/butt4")



onready var GCD = get_node("/root/SsGameChooseData")
onready var saveData = SaveFile.gData

func _ready():
	#saveData.Game1SoloScore = 0
	SaveFile.saveData()
	
#	B1.disabled = true
#	B1.but1.visible = false
#	B2.disabled = true
#	B2.but2.visible = false
#	B3.disabled = true
#	B3.but3.visible = false
#	B4.disabled = true
#	B4.but4.visible = false
	
	


func End():
	get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").visible = true
	get_tree().get_root().get_node("Game1main/PlayerButs/PauseUI/CenterContainer/VBoxContainer/Resume").visible = false
	get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = true
	
	self.visible = true
	
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(EndL, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1, Tween.TRANS_EXPO,Tween.EASE_OUT)
	tween.start()
	
	if GCD.playerCount != 1:
		Party()
	else:
		Solo()
	


func _on_EndScore_pressed():
	get_node("DissapEnding").play("DisEnd")
	yield(get_tree().create_timer(0.35), "timeout")
	get_tree().paused = true
	get_node("AppEnding").play("AppEnd")
	get_tree().get_root().get_node("Game1main/Scores").visible = false

func Party():
	var tween = Tween.new()
	add_child(tween)
	yield(get_tree().create_timer(0.5), "timeout")
	tween.interpolate_property(Win, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1, Tween.TRANS_EXPO,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.1), "timeout")
	
	wAnim.play("Winner")
	yield(get_tree().create_timer(2), "timeout")
	if GCD.Winner == GCD.ScP4:
		get_node("Winner!/VBoxContainer/Black").visible = true
		wAnim.play("Black")
		yield(get_tree().create_timer(0.5), "timeout")
	if GCD.Winner == GCD.ScP3:
		get_node("Winner!/VBoxContainer/Green").visible = true
		wAnim.play("Green")
		yield(get_tree().create_timer(0.5), "timeout")
	if GCD.Winner == GCD.ScP1:
		get_node("Winner!/VBoxContainer/Blue").visible = true
		wAnim.play("Blue")
		yield(get_tree().create_timer(0.5), "timeout")
	if GCD.Winner == GCD.ScP2:
		get_node("Winner!/VBoxContainer/Red").visible = true
		wAnim.play("Red")
		yield(get_tree().create_timer(0.5), "timeout")
	
	get_node("EndScore").visible = true
	

func Solo():
	var tween = Tween.new()
	add_child(tween)
	
	SScore.bbcode_text = "      Score : %s" % [GCD.ScSolo]
	
	var MyScore = get_tree().get_root().get_node("Game1main/Scores")
	tween.interpolate_property(MyScore, "rect_scale",Vector2(1, 1),Vector2(0, 0), 0.3, Tween.TRANS_EXPO,Tween.EASE_IN)
	tween.start()
	
	
	if saveData.Game1SoloScore < GCD.ScSolo:
		saveData.Game1SoloScore = GCD.ScSolo
		
		get_node("VBoxContainer/ScoreSet1").visible = true
		
		yield(get_tree().create_timer(0.5), "timeout")
		tween.interpolate_property(NewHS, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1.2, Tween.TRANS_BOUNCE,Tween.EASE_OUT)
		tween.start()
		
		yield(get_tree().create_timer(0.5), "timeout")

		tween.interpolate_property(SScore, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1, Tween.TRANS_ELASTIC,Tween.EASE_OUT)
		tween.start()
		
	else:
		get_node("VBoxContainer/ScoreSet3").visible = true
		yield(get_tree().create_timer(0.5), "timeout")

		tween.interpolate_property(SScore, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1, Tween.TRANS_ELASTIC,Tween.EASE_OUT)
		tween.start()
		yield(get_tree().create_timer(0.5), "timeout")
		HScore.bbcode_text = "[wave amp=20 freq=3]   Highscore : %s" % [saveData.Game1SoloScore]    
		tween.interpolate_property(HScore, "rect_scale",Vector2(0, 0),Vector2(1, 1), 1.2, Tween.TRANS_EXPO,Tween.EASE_OUT)
		tween.start()
		
	yield(get_tree().create_timer(0.8), "timeout")
	get_node("EndScore").visible = true
	
	
	SaveFile.saveData()
	
	pass
