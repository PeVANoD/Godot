extends Node


const SAVE_FILE = "user://save_file.save"
var gData = {}

func _ready():
	loadData()

func saveData():
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(gData)
	file.close()

func loadData():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		gData = {
			"Game1SoloScore": 0,
			"Smth": 1,
		}
		saveData()
	file.open(SAVE_FILE, File.READ)
	gData = file.get_var()
	file.close()
