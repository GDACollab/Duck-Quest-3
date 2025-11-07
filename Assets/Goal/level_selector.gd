extends Area2D

var levels_dir = DirAccess.open("res://Assets/Levels/")

const file_extension : String = "res://Assets/Levels/"

var files_array : Array = []

func _ready() -> void:
	files_array = levels_dir.get_files()

func _on_body_entered(body: CharacterBody2D) -> void:
	if (body.name == "Player"):
		get_tree().change_scene_to_file.call_deferred(file_extension + files_array.pick_random())
		
