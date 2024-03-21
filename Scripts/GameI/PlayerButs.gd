extends Control

func _ready():
	pass

onready var GCD = get_node("/root/SsGameChooseData")

onready var but1 = get_node("butt1")
onready var but2 = get_node("butt2")
onready var but3 = get_node("butt3")
onready var but4 = get_node("butt4")


func _on_butSolo_pressed():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/Solo").Flap()
	
func _on_but1_pressed():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P1").Flap()
	#get_node("but1").show_behind_parent = true
	
	var scale = but1.rect_scale.x
	
	GCD.But1 = 1
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(but1, "rect_scale",Vector2(1,1),Vector2(scale+0.1,scale+0.1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(but1, "rect_scale",Vector2(scale+0.1, scale+0.1),Vector2(1,1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	

func _on_but2_pressed():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P2").Flap()
	#get_node("but2").show_behind_parent = true
	
	var scale = but2.rect_scale.x
	
	GCD.But2 = 1
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(but2, "rect_scale",Vector2(1,1),Vector2(scale+0.1,scale+0.1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(but2, "rect_scale",Vector2(scale+0.1, scale+0.1),Vector2(1,1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()


func _on_but3_pressed():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P3").Flap()
	#get_node("but3").show_behind_parent = true

	var scale = but3.rect_scale.x

	GCD.But3 = 1

	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(but3, "rect_scale",Vector2(1,1),Vector2(scale+0.1,scale+0.1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(but3, "rect_scale",Vector2(scale+0.1, scale+0.1),Vector2(1,1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()

func _on_but4_pressed():
	get_tree().get_root().get_node("Game1main/Game2D/Birds/P4").Flap()
	#get_node("but4").show_behind_parent = true

	var scale = but4.rect_scale.x

	GCD.But4 = 1

	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(but4, "rect_scale",Vector2(1,1),Vector2(scale+0.1,scale+0.1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.08), "timeout")
	tween.interpolate_property(but4, "rect_scale",Vector2(scale+0.1, scale+0.1),Vector2(1,1),0.08,Tween.TRANS_QUAD,Tween.EASE_OUT)
	tween.start()
