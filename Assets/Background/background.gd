extends Sprite2D

## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE

var bg_dir := DirAccess.open("res://Assets/Background/Background Assets/")

func choose_background():
	var bg_sprites : Array = []
	
	bg_dir.list_dir_begin()
	for file: String in bg_dir.get_files():
		if ".import" not in file:
			var resource := bg_dir.get_current_dir() + "/" + file
			bg_sprites.append(resource)

	randomize()
	bg_sprites.shuffle()
	print(bg_sprites[0])
	self.texture = load(bg_sprites[0])


func _ready() -> void:
	choose_background()
