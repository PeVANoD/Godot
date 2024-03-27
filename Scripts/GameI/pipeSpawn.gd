extends Node2D

onready var GCD = get_node("/root/SsGameChooseData")

var Pipes = preload("res://Scenes/PipeHandler.tscn")

var shift = 0
var sshift = 0
var First = 1


var Y = 0

func _ready():
	if GCD.playerCount == 1:
		GCD.pipeExpance = -320
	elif GCD.playerCount == 2:
		GCD.pipeExpance = -330
	else: 
		GCD.pipeExpance = -340

func _on_Timer_timeout():
	if GCD.playerCount == 1 and GCD.pipeExpance < -290:
		GCD.pipeExpance += 3
	elif GCD.pipeExpance < -290:
		GCD.pipeExpance += 2
		
	var Rdif = -290-GCD.pipeExpance

	var pipe = Pipes.instance()
	
	Y = rand_range(-157.5+Rdif,157.5-Rdif)
	
#	var first_value = bool(randi() % 2)
#	if first_value:
#		Y = -157.5+Rdif
#	else:
#		Y = 157.5-Rdif
	
	pipe.position.y = Y
	add_child(pipe)

	
	GCD.PrevYY = GCD.PrevY
	GCD.PrevY = Y
	
	if GCD.Stopped == 3:
		Mooove()




func Mooove():
	shift = Y
	get_node("Timers/TimerforSecond").start()
	shift = GCD.PrevYY
	
	_on_TimerforSecond_timeout()
	
func _on_TimerforSecond_timeout():
	GCD.Stopped = 3
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P3, "position",Vector2(P3.position.x,P3.position.y),Vector2(P3.position.x,240+shift*1.15),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds1").start()
func _on_TimerforBirds1_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P2, "position",Vector2(P2.position.x,P2.position.y),Vector2(P2.position.x,240+shift*1.05),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds2").start()
	sshift = shift
func _on_TimerforBirds2_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P1, "position",Vector2(P1.position.x,P1.position.y),Vector2(P1.position.x,240+sshift*0.95),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	get_node("Timers/TimerforBirds3").start()
func _on_TimerforBirds3_timeout():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(P4, "position",Vector2(P4.position.x,P4.position.y),Vector2(P4.position.x,240+sshift*0.85),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	

func ChangeTime(Hard):
	if Hard:
		get_node("Timer").wait_time = 1.33333
		get_node("Timers/TimerforBirds1").wait_time = 0.26666
		get_node("Timers/TimerforBirds2").wait_time = 0.26666
		get_node("Timers/TimerforBirds3").wait_time = 0.26666
		get_node("Timers/TimerforSecond").wait_time = 1.93333
	else:
		get_node("Timer").wait_time = 2
		get_node("Timers/TimerforBirds1").wait_time = 0.4
		get_node("Timers/TimerforBirds2").wait_time = 0.4
		get_node("Timers/TimerforBirds3").wait_time = 0.4
		get_node("Timers/TimerforSecond").wait_time = 2.9




onready var P1 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P1")
onready var P2 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P2")
onready var P3 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P3")
onready var P4 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P4")









