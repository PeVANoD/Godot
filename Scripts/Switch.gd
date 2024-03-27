extends Panel


func _ready():
	pass
	
	
func switch_button_pressed():
	var GCD = get_node("/root/SsGameChooseData")
	
	InfoBut()
	
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/LBut").disabled = true
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/RBut").disabled = true
	
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/TOffTexture/TOff").play("TOff")
	yield(get_tree().create_timer(0.8), "timeout")
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/G2").stop()
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/G3").stop()
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/Flapps").stop()
	
	if (GCD.gameNum == 1):
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/Flapps").play("Flapps")
	if (GCD.gameNum == 2):
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/G2").play("G2")
	if (GCD.gameNum == 3):
		get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/GameWin/Flapps/GameTitleTexture/G3").play("G3")
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/LBut").disabled = false
	get_tree().get_root().get_node("Main/UI/MenuUI/ChooseGameWin/Switch/RBut").disabled = false



func InfoBut():
	var GCD = get_node("/root/SsGameChooseData")
	var num = GCD.gameNum
	
	if (num == 1):
		get_tree().get_root().get_node("Main/UI/MenuUI/InfoBut").disabled = false
	if (num == 2):
		get_tree().get_root().get_node("Main/UI/MenuUI/InfoBut").disabled = true
	if (num == 3):
		get_tree().get_root().get_node("Main/UI/MenuUI/InfoBut").disabled = true
	
	
	
