extends Control

onready var GCD = get_node("/root/SsGameChooseData")

func _ready():
	var pCount = get_node("/root/SsGameChooseData").playerCount
	
	
	var pipeSpawn = get_node("Game2D/BG/pipeSpawn")
	pipeSpawn.position = Vector2(get_viewport_rect().size.x+40,pipeSpawn.position.y)
	
	get_node("Game2D/Birds/BReady").play("BirdsReady")
	AnimP()
	
	BlockTouch()
	
	get_node("PlayerButs/PreStart").visible = true
	
	if (pCount == 4):
		get_node("PlayerButs/butSolo").visible = false
		ActivatePlayer(1)
		ActivatePlayer(2)
		ActivatePlayer(3)
		ActivatePlayer(4)
	if (pCount == 3):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butSolo").visible = false
		ActivatePlayer(1)
		ActivatePlayer(2)
		ActivatePlayer(3)
	if (pCount == 2):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butt3").visible = false
		get_node("PlayerButs/butSolo").visible = false
		ActivatePlayer(1)
		ActivatePlayer(2)
	if (pCount == 1):
		get_node("PlayerButs/butt4").visible = false
		get_node("PlayerButs/butt3").visible = false
		get_node("PlayerButs/butt2").visible = false
		get_node("PlayerButs/butt1").visible = false
		ActivatePlayer(5)


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

func AnimP():
	get_node("Game2D/Birds/P1").Anim(1)
	get_node("Game2D/Birds/P2").Anim(1)
	get_node("Game2D/Birds/P3").Anim(1)
	get_node("Game2D/Birds/P4").Anim(1)

func ActivatePlayer(num):
	if (num == 1):
		get_node("Game2D/Birds/P1").visible = true
		get_node("Game2D/Birds/P1").set_collision_layer_bit(1, 2)
	if (num == 2):
		get_node("Game2D/Birds/P2").visible = true
		get_node("Game2D/Birds/P2").set_collision_layer_bit(2, 4)
	if (num == 3):
		get_node("Game2D/Birds/P3").visible = true
		get_node("Game2D/Birds/P3").set_collision_layer_bit(3, 8)
	if (num == 4):
		get_node("Game2D/Birds/P4").visible = true
		get_node("Game2D/Birds/P4").set_collision_layer_bit(4, 16)
	if (num == 5):
		get_node("Game2D/Birds/Solo").visible = true
		get_node("Game2D/Birds/Solo").set_collision_layer_bit(5, 32)
