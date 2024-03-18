extends Node2D

onready var GCD = get_node("/root/SsGameChooseData")

var Pipes = preload("res://Scenes/PipeHandler.tscn")

var Stopped = 0
var First = 1

var Y = 0

func _ready():
	pass


func _on_Timer_timeout():
	var pipe = Pipes.instance()
	Y = rand_range(-45,45)
	pipe.position.y = Y
	Y = Y*3
	add_child(pipe)
	if Stopped:
		Mooove()
	yield(get_tree().create_timer(2), "timeout")
	GCD.PrevY = Y
	yield(get_tree().create_timer(2), "timeout")
	GCD.PrevYY = Y
	

func Mooove():
	if !First:
		yield(get_tree().create_timer(1.9), "timeout")
	var shift = Y
	yield(get_tree().create_timer(1.5), "timeout")
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P3, "position",Vector2(P3.position.x,P3.position.y),Vector2(P3.position.x,240+shift*1.2),1.5,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(0.4), "timeout")
	tween.interpolate_property(P2, "position",Vector2(P2.position.x,P2.position.y),Vector2(P2.position.x,240+shift*1.05),1.5,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(0.4), "timeout")
	tween.interpolate_property(P1, "position",Vector2(P1.position.x,P1.position.y),Vector2(P1.position.x,240+shift*0.95),1.5,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(0.4), "timeout")
	tween.interpolate_property(P4, "position",Vector2(P4.position.x,P4.position.y),Vector2(P4.position.x,240+shift*0.8),1.5,Tween.TRANS_QUAD,Tween.EASE_IN)
	tween.start()
	
	

onready var P1 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P1")
onready var P2 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P2")
onready var P3 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P3")
onready var P4 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P4")
