extends Sprite2D

## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE

var player_sprites_dir = DirAccess.open("res://Assets/Player/Sprites/")

const file_extension : String = "res://Assets/Player/Sprites/"

var files_array : Array = []
var textures_array : Array = []

func _ready() -> void:
	files_array = player_sprites_dir.get_files()
	
	for t in files_array:
		if (!t.contains("import")):
			textures_array.append(t)
			
	# print(textures_array)
	texture = load(file_extension + textures_array.pick_random())
		
