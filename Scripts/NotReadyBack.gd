extends Button


func _ready():
	pass



func _on_NotReadyBack_pressed():
	get_tree().change_scene("res://Scenes/StartUI.tscn")
