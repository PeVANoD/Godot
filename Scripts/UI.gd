extends Control

onready var saveData = SaveFile.gData

func _ready():

	
	if GCD.started == 1:
		ReEnter()

onready var GCD = get_node("/root/SsGameChooseData")

func _on_GameStart_pressed():
	get_tree().get_root().get_node("Main/Background/BGAnim").BGAnim()
	
	get_node("StartUI").move(Vector2(0,-576),"rect_position", (Vector2()), 2, Tween.TRANS_EXPO,Tween.EASE_IN)
	get_node("MenuUI").move(Vector2())

	get_tree().get_root().get_node("Main/Audio/StartApp").play()
	
	get_node("StartUI/GameStart").visible = false;
	get_node("StartUI/Fade").Afade();
	yield(get_tree().create_timer(0.5), "timeout")
	get_node("StartUI/Touch").visible = false;
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/Flapps").play("Flapps")
	
	GCD.started = 1
	
	yield(get_tree().create_timer(2), "timeout")
	get_tree().get_root().get_node("Main/Audio/BGLoFi").play()
	
	
	
func ReEnter():
	if !saveData.Sound:
		get_tree().get_root().get_node("Main/UI/MenuUI/SoundSet").pressed = false
	get_tree().get_root().get_node("Main/Audio/BGLoFi").play()
	get_node("StartUI").rect_position = Vector2(get_node("StartUI").rect_position.x, -576)
	get_node("MenuUI").rect_position = Vector2(get_node("MenuUI").rect_position.x,0)
	get_node("StartUI/GameStart").visible = false;
	get_node("StartUI/Touch").visible = false;
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/Flapps").play("Flapps")
	get_tree().get_root().get_node("Main/Background").color = Color("4c72ab")
	
	
