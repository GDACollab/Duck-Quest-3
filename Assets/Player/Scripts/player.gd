extends CharacterBody2D

static var state_name: String = "Move"
var dir := DirAccess.open("res://Assets/Audio/Player Jump SFX/")



@export var rotation_speed: float
@export var move_speed = 500
@export var acceleration = 1200

@onready var AUDIO : AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	choose_jump_sound()

func _physics_process(delta: float) -> void:
	var move_direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	var target_move_velocity : Vector2 
	target_move_velocity.x = move_direction * move_speed
	target_move_velocity.y = velocity.y
	
	velocity = velocity.move_toward(
		target_move_velocity,
		acceleration * delta,
	)

	velocity.y += 980 * delta
	if(Input.is_action_just_pressed("ui_accept") and is_on_floor()):
		velocity.y -= 500
		AUDIO.play()
	move_and_slide()



func choose_jump_sound():
	var jump_sounds : Array = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if ".import" not in file:
			var resource := dir.get_current_dir() + "/" + file
			jump_sounds.append(resource)
			
	randomize()
	jump_sounds.shuffle()
	AUDIO.stream = load(jump_sounds[0])
	
