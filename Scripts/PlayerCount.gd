extends Control

func _ready():
	Pswitch()

func Pswitch():
	get_node("StartAnim").play("StartAnim")
	
	yield(get_tree().create_timer(0.75), "timeout")

	
	var GCD = get_node("/root/SsGameChooseData")
	if (GCD.gameNum == 1):
		get_node("PlayerButtons/P1").disabled = false
		get_node("PlayerButtons/P2").disabled = false
		get_node("PlayerButtons/P3").disabled = false
		get_node("PlayerButtons/P4").disabled = false
	if (GCD.gameNum == 2):
		get_node("PlayerButtons/P2").disabled = false
		get_node("PlayerButtons/P4").disabled = false
	if (GCD.gameNum == 3):
		get_node("PlayerButtons/P2").disabled = false

