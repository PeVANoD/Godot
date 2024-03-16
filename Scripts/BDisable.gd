extends CheckButton


func _ready():
	pass




func _on_BDisable_toggled(button_toggled):
	if (button_toggled):
		get_tree().get_root().get_node("Players/PlayerButtons/P1").disabled = false
		get_tree().get_root().get_node("Players/PlayerButtons/P2").disabled = false
		get_tree().get_root().get_node("Players/PlayerButtons/P3").disabled = false
		get_tree().get_root().get_node("Players/PlayerButtons/P4").disabled = false
	else:
		get_tree().get_root().get_node("Players/PlayerButtons/P1").disabled = true
		get_tree().get_root().get_node("Players/PlayerButtons/P2").disabled = true
		get_tree().get_root().get_node("Players/PlayerButtons/P3").disabled = true
		get_tree().get_root().get_node("Players/PlayerButtons/P4").disabled = true
