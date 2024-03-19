extends Button

onready var GCD = get_node("/root/SsGameChooseData")

func _ready():
	pass



func _on_NotReadyBack_pressed():
	GCD.gameNum = 1
	get_tree().change_scene("res://Scenes/StartUI.tscn")
