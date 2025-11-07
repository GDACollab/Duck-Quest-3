extends Area2D

var dir := DirAccess.open("res://Assets/Text Files/")
var interactable : bool = false
var interacting : bool = false

@onready var LABEL : Label = $Label


func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	check_interaction()
	
	


	
	
func check_interaction() -> void:
	if Input.is_action_just_pressed("Enter") and interactable:
		LABEL.show()



func choose_and_parse_txt_file() -> void:
	var text_files : Array = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if ".import" not in file:
			var resource := dir.get_current_dir() + "/" + file
			text_files.append(resource)
			
	randomize()
	text_files.shuffle()
	var text_path = text_files[0]
	
	var file_access = FileAccess.open(text_path, FileAccess.READ)
	if file_access:
		LABEL.text = file_access.get_as_text()
	
	
	




	
## SIGNAL FUNCTIONS

func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = true



func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = false
		LABEL.hide()
