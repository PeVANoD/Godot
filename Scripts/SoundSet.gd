extends CheckButton

onready var saveData = SaveFile.gData
	
func _ready():
	print(saveData.Sound)
	if !saveData.Sound:
		self.pressed = false
	elif saveData.Sound == 2:
		self.pressed = false
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
		#_on_SoundSet_toggled(1)
	

var pres = 0

func _on_SoundSet_toggled(button_toggled):
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(0.93, 0.93),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	
	if pres == 0:
		pres = 1
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
		saveData.Sound = 0
		print(pres)
		yield(get_tree().create_timer(0.1), "timeout")
		get_tree().get_root().get_node("Main/Audio/Sel1").play()
	else:
		pres = 0
		get_tree().get_root().get_node("Main/Audio/Sel2").play()
		print(pres)
		yield(get_tree().create_timer(0.2), "timeout")
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
		saveData.Sound = 1
	
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1, 1),0.08,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()

		
	SaveFile.saveData()
