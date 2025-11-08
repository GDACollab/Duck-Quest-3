extends RigidBody2D

## Random Script Selection
var enemy_scripts_dir = DirAccess.open("res://Assets/Enemy/Scripts/")
const file_extension: String = "res://Assets/Enemy/Scripts/"
var files_array: PackedStringArray
var scripts_array: Array[String] = []
var custom_script: EnemyBehaviorScript

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

func _physics_process(delta: float) -> void:
	if !%Player: 
		printerr("[WARNING] Enemy requires that a node 'Player' exists within the same scene that has 'Access as Unique Name' enabled")
		get_tree().quit()
	else:
		# Call the custom move function from the selected EnemyScript
		linear_velocity = custom_script.move(global_position, %Player.global_position, delta)
	
