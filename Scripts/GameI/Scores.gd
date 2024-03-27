extends Control

onready var GCD = get_node("/root/SsGameChooseData")

onready var P1 = get_node("ScoreP1")
onready var P2 = get_node("ScoreP2")
onready var P3 = get_node("ScoreP3")
onready var P4 = get_node("ScoreP4")
onready var Solo = get_node("ScoreSolo")

onready var S1 = 0
onready var S2 = 0
onready var S3 = 0
onready var S4 = 0
onready var SS = 0

#onready var B1 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P1")
#onready var B2 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P2")
#onready var B3 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P3")
#onready var B4 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P4")

onready var ScAn1 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P1/AScore")
onready var ScAn2 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P2/AScore")
onready var ScAn3 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P3/AScore")
onready var ScAn4 = get_tree().get_root().get_node("Game1main/Game2D/Birds/P4/AScore")
onready var ScAnS = get_tree().get_root().get_node("Game1main/Game2D/Birds/Solo/AScore")

func _ready():
	scoreNull()


func _process(_delta):
	if S1 != GCD.ScP1:
		ScAn1.play("Scoring")
		if GCD.ScP1 > 0:
			get_tree().get_root().get_node("Game1main/Audio/Game/Score").play()
		S1 = GCD.ScP1
		
	if S2 != GCD.ScP2:
		ScAn2.play("Scoring")
		if GCD.ScP2 > 0:
			get_tree().get_root().get_node("Game1main/Audio/Game/Score").play()
		S2 = GCD.ScP2
		
	if S3 != GCD.ScP3:
		ScAn3.play("Scoring")
		if GCD.ScP3 > 0:
			get_tree().get_root().get_node("Game1main/Audio/Game/Score").play()
		S3 = GCD.ScP3
		
	if S4 != GCD.ScP4:
		ScAn4.play("Scoring")
		if GCD.ScP4 > 0:
			get_tree().get_root().get_node("Game1main/Audio/Game/Score").play()
		S4 = GCD.ScP4
		
	if SS != GCD.ScSolo:
		ScAnS.play("Scoring")
		if GCD.ScSolo > 0:
			get_tree().get_root().get_node("Game1main/Audio/Game/Score").play()
		SS = GCD.ScSolo
		
	
	
	P1.text = str("\n ",GCD.ScP1)
	P2.text = str("\n    ",GCD.ScP2)
	P3.text = str("    ",GCD.ScP3)
	P4.text = str(" ",GCD.ScP4)
	Solo.text = str("Score\n   ",GCD.ScSolo)


func scoreNull():
	GCD.ScSolo = -1
	GCD.ScP1 = -1
	GCD.ScP2 = -1
	GCD.ScP3 = -1
	GCD.ScP4 = -1
	GCD.Winner = 0
