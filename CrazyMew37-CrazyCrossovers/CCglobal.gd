extends Node
class_name CCglobal

# Save function
func save_to():
	var CCSaveData = preload("res://mods-unpacked/CrazyMew37-CrazyCrossovers/CCSaveData.gd")
	var file_name = "CCcurrent_save.tres"
	
	var save_data = CCSaveData.new()

	ResourceSaver.save(save_data, SaveFileService.SAVE_FILE_PATH + file_name)
	print("crazy crossovers saved to: ", SaveFileService.SAVE_FILE_PATH + file_name)
	
func load_save():
	print("loading crazy crossovers save")
	var file_path = SaveFileService.SAVE_FILE_PATH + "CCcurrent_save.tres"
	if FileAccess.file_exists(file_path):
		var loaded = ResourceLoader.load(file_path)
		if loaded:
			print("crazy crossovers save loaded successfully")
		else:
			print("Failed to load crazy crossovers save file.")
	else:
		print("crazy crossovers save file not found")

func delete_save():
	print("deleting crazy crossovers save")
	var file_path = SaveFileService.SAVE_FILE_PATH + "CCcurrent_save.tres"
	if FileAccess.file_exists(file_path):
		DirAccess.remove_absolute(file_path)
		print("crazy crossovers save deleted")
	else:
		print("crazy crossovers save file not found")
	reset_stats()

func reset_stats():
	print("resetting crazy crossovers stats")
