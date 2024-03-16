extends Control

onready var GCD = get_node("/root/SsGameChooseData")

func _ready():
	var pCount = get_node("/root/SsGameChooseData").playerCount
	
	BlockTouch()
	
	get_node("PlayerButs/PreStart").visible = true
	
	if (pCount == 4):
		get_node("PlayerButs/butSolo").visible = false
		
		get_node("Game2D/Birds/P1").visible = true
		get_node("Game2D/Birds/P2").visible = true
		get_node("Game2D/Birds/P3").visible = true
		get_node("Game2D/Birds/P4").visible = true
	if (pCount == 3):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butSolo").visible = false
		
		get_node("Game2D/Birds/P1").visible = true
		get_node("Game2D/Birds/P2").visible = true
		get_node("Game2D/Birds/P3").visible = true
	if (pCount == 2):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butt3").visible = false
		get_node("PlayerButs/butSolo").visible = false
		
		get_node("Game2D/Birds/P1").visible = true
		get_node("Game2D/Birds/P2").visible = true
	if (pCount == 1):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butt3").visible = false
		get_node("PlayerButs/butt2").visible = false
		get_node("PlayerButs/butt1").visible = false
		
		get_node("Game2D/Birds/Solo").visible = true

	print(get_tree().get_root().get_node("Game1main/PlayerButs/butt1").show_behind_parent)
	print(get_tree().get_root().get_node("Game1main/PlayerButs/PreStart").show_behind_parent)

	var T1
	if GCD.playerCount == 1:
		T1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesSolo")
	else:
		T1 = get_tree().get_root().get_node("Game1main/PlayerButs/PreStart/PreRulesText1")
		
	T1.visible = true 


func _on_Pause_pressed():
	get_node("PlayerButs/PauseUI").Paused()

func BlockTouch():
	get_node("PlayerButs/butt1/but1").visible = false
	get_node("PlayerButs/butt2/but2").visible = false
	get_node("PlayerButs/butt3/but3").visible = false
	get_node("PlayerButs/butt4/but4").visible = false


