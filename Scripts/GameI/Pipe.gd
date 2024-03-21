extends KinematicBody2D

onready var GCD = get_node("/root/SsGameChooseData")
#const pipeTxtr = ["",""]
#onready var sprite: Sprite = get_node("Sprite")
onready var topPipe = get_node("TPipe")
onready var botPipe = get_node("BPipe")


onready var velocity

const SPEED = -200.0

func _ready():
	topPipe.position.y = GCD.pipeExpance
	botPipe.position.y = -GCD.pipeExpance
	velocity = Vector2(SPEED, 0)
	var _k = move_and_collide(Vector2(get_viewport_rect().size.x/12,0))
	

	
func _physics_process(delta):
	var _k = move_and_collide(velocity * delta)

	
#	for index in get_slide_count():
#		print(index)
#		var collision = get_slide_collision(index)
#		if collision.collider.is_in_group("Bird1"):
#			print("1 - Dead")
#		if collision.collider.is_in_group("Bird2"):
#			print("2 - Dead")
#		if collision.collider.is_in_group("Bird3"):
#			print("3 - Dead")
#		if collision.collider.is_in_group("Bird4"):
#			print("4 - Dead")
#		if collision.collider.is_in_group("BirdS"):
#			print("S - Dead")

func _on_VisibilityNotifier2D_screen_exited():
	DisableShape(topPipe)
	DisableShape(botPipe)
	#print("\n===Score===\nSolo: ", GCD.ScSolo,"\nP1: ",GCD.ScP1,"\nP2: ",GCD.ScP2,"\nP3: ",GCD.ScP3,"\nP4: ",GCD.ScP4,"\n====End====\n")
	#queue_free()


func DisableShape(shape: Node):
	shape.set_deferred("disabled", true)
	pass



func _on_DetP1_area_entered(_area):
	GCD.ScP1 += 1


func _on_DetP2_area_entered(_area):
	GCD.ScP2 += 1


func _on_DetP3_area_entered(_area):
	GCD.ScP3 += 1


func _on_DetP4_area_entered(_area):
	GCD.ScP4 += 1


func _on_DetSolo_area_entered(_area):
	GCD.ScSolo += 1
