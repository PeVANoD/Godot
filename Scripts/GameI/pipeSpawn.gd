extends Node2D

onready var GCD = get_node("/root/SsGameChooseData")

var Pipes = preload("res://Scenes/PipeHandler.tscn")

var shift = 0
var sshift = 0
var First = 1

var Y = 0

func _ready():
	pass


func _on_Timer_timeout():
	get_node("Timers/TimerY").start()
	var pipe = Pipes.instance()
	Y = rand_range(-45,45)*3.5
	pipe.position.y = Y
	add_child(pipe)
	GCD.PrevY = Y
	if GCD.Stopped == 2:
		Mooove()


func _on_TimerY_timeout():
	GCD.PrevYY = Y
	get_node("Timers/TimerYY").start()

func _on_TimerYY_timeout():
	GCD.PrevYYY = Y


func Mooove():
	if !First:
		get_node("Timers/TimerforSecond").start()
	shift = Y
	_on_TimerforSecond_timeout()
func _on_TimerforSecond_timeout():
	get_node("Timers/TimerforFirst").start()
func _on_TimerforFirst_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P3, "position",Vector2(P3.position.x,P3.position.y),Vector2(P3.position.x,240+shift*1.15),2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds1").start()
func _on_TimerforBirds1_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P2, "position",Vector2(P2.position.x,P2.position.y),Vector2(P2.position.x,240+shift*1.05),2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds2").start()
	sshift = shift
func _on_TimerforBirds2_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P1, "position",Vector2(P1.position.x,P1.position.y),Vector2(P1.position.x,240+sshift*0.95),2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds3").start()
func _on_TimerforBirds3_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P4, "position",Vector2(P4.position.x,P4.position.y),Vector2(P4.position.x,240+sshift*0.85),2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	
	

onready var P1 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P1")
onready var P2 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P2")
onready var P3 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P3")
onready var P4 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P4")









