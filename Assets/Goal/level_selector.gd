extends Area2D

var levels_dir = DirAccess.open("res://Assets/Levels/")

const file_extension : String = "res://Assets/Levels/"

var files_array : Array = []

@onready var AUDIO : AudioStreamPlayer2D = $"Win SFX"
var dir := DirAccess.open("res://Assets/Audio/Win SFX/")
var level_complete : bool = false

func _ready() -> void:
	files_array = levels_dir.get_files()
	choose_win_sound()

func _on_body_entered(body: CharacterBody2D) -> void:
	if (body.name == "Player") and not level_complete:
		AUDIO.play()
		level_complete = true
		
func _on_win_sfx_finished() -> void:
	get_tree().change_scene_to_file.call_deferred(file_extension + files_array.pick_random())



func choose_win_sound():
	var win_sfx : Array = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if ".import" not in file:
			var resource := dir.get_current_dir() + "/" + file
			win_sfx.append(resource)
			
	randomize()
	win_sfx.shuffle()
	AUDIO.stream = load(win_sfx[0])
