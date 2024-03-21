extends CheckButton



func _ready():
	pass



func _on_DevCam_toggled(toggle_mode):
	if toggle_mode:
		get_tree().get_root().get_node("Main/DevUI/DevCam").set_zoom(Vector2(2,2));
	else:
		get_tree().get_root().get_node("Main/DevUI/DevCam").set_zoom(Vector2(1,1));

