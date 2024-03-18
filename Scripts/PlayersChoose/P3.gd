extends TextureButton


func _ready():
	pass


func _on_P3_pressed():
	var texture1 = preload("res://Sprites/PlayerBut3.png")
	var texture2 = preload("res://Sprites/PlayerBut3B.png")
	
	Chosen()
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(0.93, 0.93),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	self.texture_normal = texture2;
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(self, "rect_scale",self.rect_scale,Vector2(1, 1),0.08,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	self.texture_normal = texture1;
	yield(get_tree().create_timer(0.12), "timeout")
	
	GameStart()
	
	


func Chosen():
	var GCD = get_node("/root/SsGameChooseData")
	
	GCD.playerCount = 3
	
func GameStart():
	var GCD = get_node("/root/SsGameChooseData")
	var gNum = GCD.gameNum
	var pCount = GCD.playerCount
	
	if gNum == 1:
		if pCount == 1:
			var _Fix = get_tree().change_scene("res://Scenes/Game1.tscn")
		else:
			var _Fix = get_tree().change_scene("res://Scenes/Game1.tscn")
	if gNum == 2:
		var _Fix = get_tree().change_scene("res://Scenes/NotReady.tscn")
	if gNum == 3:
		var _Fix = get_tree().change_scene("res://Scenes/NotReady.tscn")
