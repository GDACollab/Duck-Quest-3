extends AudioStreamPlayer
var dir := DirAccess.open("res://Assets/Audio/Background Music/")


func _ready() -> void:
	choose_bg_music()
	self.play()

func choose_bg_music():
	var music : Array = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if ".import" not in file:
			var resource := dir.get_current_dir() + "/" + file
			music.append(resource)
			
	randomize()
	music.shuffle()
	self.stream = load(music[0])
