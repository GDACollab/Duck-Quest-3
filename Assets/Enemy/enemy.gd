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

var dir := DirAccess.open("res://Assets/Audio/Enemy SFX/")
@onready var AUDIO : AudioStreamPlayer2D = $AudioStreamPlayer2D





func _ready() -> void:
	choose_enemy_sound()
	AUDIO.playing = true
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
	

func choose_enemy_sound():
	var win_sfx : Array = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if ".import" not in file:
			var resource := dir.get_current_dir() + "/" + file
			win_sfx.append(resource)
			
	randomize()
	win_sfx.shuffle()
	AUDIO.stream = load(win_sfx[0])
