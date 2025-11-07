extends RigidBody2D

## Random Script Selection
var enemy_scripts_dir = DirAccess.open("res://Assets/Enemy/Scripts/")
const file_extension: String = "res://Assets/Enemy/Scripts/"
var files_array: PackedStringArray
var scripts_array: Array[String] = []
var custom_script: EnemyScript

## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE

func _ready() -> void:
	## Random Script Selection
	files_array = enemy_scripts_dir.get_files()
	for t: String in files_array:
		if (!t.contains("import") && !t.contains("uid")):
			scripts_array.append(t)
	# print(scripts_array)
	custom_script = load(file_extension + scripts_array.pick_random()).new()

func _process(delta: float) -> void:
	## TODO add player position to this call (use singleton or known relative location of player in scenetree to have a player reference)
	linear_velocity = custom_script.move(global_position, %Player.global_position, delta)
	
