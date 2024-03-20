extends Node2D

onready var GCD = get_node("/root/SsGameChooseData")

var Pipes = preload("res://Scenes/PipeHandler.tscn")
var StopPipes = Pipes.instance()

var CheckWin = 1
var Ready = 0
var TY = 0

onready var P1 = get_node("Birds/P1")
onready var P2 = get_node("Birds/P2")
onready var P3 = get_node("Birds/P3")
onready var P4 = get_node("Birds/P4")

func _ready():
	pass

func _process(_delta):
	CheckButs()
	
	GCD.AreWeAlive = GCD.Alive1 + GCD.Alive2 + GCD.Alive3 + GCD.Alive4 + GCD.AliveS -1
	
	if  GCD.playerCount == 1 and GCD.AliveS == 0:
		get_tree().paused = true
		set_process(!is_processing())
		
		yield(get_tree().create_timer(0.3), "timeout")
		get_tree().get_root().get_node("Game1main/EndScreen").End()
		return
	
	if (GCD.AreWeAlive == -1) and CheckWin == 1 and GCD.AliveS == 0:
		get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = true
		set_process(!is_processing())
		PipeOff()
		GCD.Winner = max(GCD.ScP1,GCD.Winner)
		GCD.Winner = max(GCD.ScP2,GCD.Winner)
		GCD.Winner = max(GCD.ScP3,GCD.Winner)
		GCD.Winner = max(GCD.ScP4,GCD.Winner)
		GCD.Stopped = 1
		preOFF()
		Ready = 1
		yield(get_tree().create_timer(0.5), "timeout")
		#OFF()
		yield(get_tree().create_timer(1.5), "timeout")
		GCD.Stopped = 2
		get_tree().get_root().get_node("Game1main/EndScreen").End()
		return
		
	if (GCD.AreWeAlive == 0) and GCD.AliveS == 0:
		get_tree().get_root().get_node("Game1main/PlayerButs/Pause").disabled = true
		yield(get_tree().create_timer(4.1), "timeout")
		if (GCD.AreWeAlive == 0) and CheckWin == 1:
			CheckWin = 0
			set_process(!is_processing())
			PipeOff()
			GCD.Winner = max(GCD.ScP1,GCD.Winner)
			GCD.Winner = max(GCD.ScP2,GCD.Winner)
			GCD.Winner = max(GCD.ScP3,GCD.Winner)
			GCD.Winner = max(GCD.ScP4,GCD.Winner)
			GCD.Stopped = 1
			preOFF()
			Ready = 1
			OFF()
			yield(get_tree().create_timer(0.5), "timeout")
			GCD.Stopped = 2
			get_tree().get_root().get_node("Game1main/EndScreen").End()
			return
	
		

func CheckButs():
	if !GCD.Alive1:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1").disabled = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt1/but1").visible = false
	if !GCD.Alive2:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2").disabled = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt2/but2").visible = false
	if !GCD.Alive3:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3").disabled = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt3/but3").visible = false
	if !GCD.Alive4:
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4").disabled = true
		get_tree().get_root().get_node("Game1main/PlayerButs/butt4/but4").visible = false

func PipeOff():
	P1.set_collision_layer_bit(1, false)
	P2.set_collision_layer_bit(2, false)
	P3.set_collision_layer_bit(3, false)
	P4.set_collision_layer_bit(4, false)

func OFF():
	
	P1.player_move(false)
	yield(get_tree().create_timer(0.3), "timeout")
	P2.player_move(false)
	yield(get_tree().create_timer(0.3), "timeout")
	P3.player_move(false)
	yield(get_tree().create_timer(0.3), "timeout")
	P4.player_move(false)
	
	
func preOFF():
	P1.visible = false
	P2.visible = false
	P3.visible = false
	P4.visible = false
	whoWin()
	goAnim()
	
func whoWin():
	if GCD.Winner == GCD.ScP1:
		P1.visible = true
	if GCD.Winner == GCD.ScP2:
		P2.visible = true
	if GCD.Winner == GCD.ScP3:
		P3.visible = true
	if GCD.Winner == GCD.ScP4:
		P4.visible = true


func BirdsBack():
	print("BACK!")
	var shift = GCD.PrevY
	TY = shift
	var tween = Tween.new()
	add_child(tween)
	
	if GCD.Stopped == 1:
		print("1: ",shift," ", GCD.PrevYYY, " ", GCD.PrevYY," ", GCD.PrevY)
		tween.interpolate_property(P3, "position",Vector2(P3.position.x,P3.position.y),Vector2(440,240+shift*0.95),2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P3, "rotation_degrees",P3.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P2, "position",Vector2(P2.position.x,P2.position.y),Vector2(365,240+shift*1.05),1.6,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P2, "rotation_degrees",P2.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P1, "position",Vector2(P1.position.x,P1.position.y),Vector2(290,240+shift*1.1),1.2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P1, "rotation_degrees",P1.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P4, "position",Vector2(P4.position.x,P4.position.y),Vector2(210,240+shift*1),0.8,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P4, "rotation_degrees",P4.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		GCD.Stopped = 2
		yield(get_tree().create_timer(0.8), "timeout")
		
		if shift != GCD.PrevYY and GCD.PrevYY!= 0:
			if GCD.PrevYYY == 0:
				shift = GCD.PrevYY
			else:
				shift = GCD.PrevYYY
		else: 
			shift = GCD.PrevY


	if GCD.Stopped == 2:
		print("2: ", shift," ", GCD.PrevYYY, " ", GCD.PrevYY," ", GCD.PrevY)
		tween.interpolate_property(P3, "position",Vector2(P3.position.x,P3.position.y),Vector2(440,240+shift*0.95),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P3, "rotation_degrees",P3.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P2, "position",Vector2(P2.position.x,P2.position.y),Vector2(365,240+shift*1.05),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P2, "rotation_degrees",P2.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P1, "position",Vector2(P1.position.x,P1.position.y),Vector2(290,240+shift*1.1),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P1, "rotation_degrees",P1.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		yield(get_tree().create_timer(0.4), "timeout")
		tween.interpolate_property(P4, "position",Vector2(P4.position.x,P4.position.y),Vector2(210,240+shift*0.9),1.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
		tween.start()
		tween.interpolate_property(P4, "rotation_degrees",P4.rotation_degrees,0,1,Tween.TRANS_QUAD,Tween.EASE_IN)
		tween.start()
		GCD.Stopped = 3
		yield(get_tree().create_timer(0.8), "timeout")
			
	GCD.Stopped = 3

func goAnim():
	P1.Anim(1)
	P2.Anim(1)
	P3.Anim(1)
	P4.Anim(1)


func _on_Timer_timeout():
	if Ready:
		OFF()
		print("GOO")
		BirdsBack()
		Ready = 0
	
