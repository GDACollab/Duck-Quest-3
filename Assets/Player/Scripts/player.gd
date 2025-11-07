class_name Player
extends CharacterBody2D

static var state_name: String = "Move"
var jump_dir := DirAccess.open("res://Assets/Audio/Player Jump SFX/")
var ability_dir := DirAccess.open("res://Assets/Player/Ability Scripts/")

## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE
## WARNING: DO NOT MODIFY THIS FILE

@export var move_speed = 800
@export var acceleration = 3200
@export var jump_height = 700


@onready var AUDIO : AudioStreamPlayer2D = $AudioStreamPlayer2D

var _gravity: bool = true
@onready var _q_ability: Node2D = $QAbility

func _ready() -> void:
	_choose_ability()
	_choose_jump_sound()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("ability")):
		_q_ability.ability_just_pressed()
	if(Input.is_action_just_released("ability")):
		_q_ability.ability_just_released()

func _physics_process(delta: float) -> void:
	var move_direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	var target_move_velocity : Vector2 
	target_move_velocity.x = move_direction * move_speed
	target_move_velocity.y = velocity.y
	
	velocity = velocity.move_toward(
		target_move_velocity,
		acceleration * delta,
	)
	if(_gravity):
		velocity.y += 980 * delta
	
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y -= jump_height
		AUDIO.play()
	move_and_slide()

## [b]Purpose[/b]: Toggles the gravity of the player on or off.[br]
##[br]
## [b]Parameters[/b]: value: a boolean value that determines if gravity is on or off.[br]
##             true: gravity is on[br]
##             false: gravity is off[br]
##[br]
## [b]Returns[/b]: Nothing.[br]
func toggle_gravity(value:bool)->void:
	_gravity = value

func _choose_ability():
	var ability_scripts : Array = []
	ability_dir.list_dir_begin()
	for file: String in ability_dir.get_files():
		if ".gd" in file and ".uid" not in file:
			var resource := ability_dir.get_current_dir() + "/" + file
			ability_scripts.append(resource)
	randomize()
	ability_scripts.shuffle()
	print(ability_scripts)
	_q_ability.set_script(load(ability_scripts[0]))

func _choose_jump_sound():
	var jump_sounds : Array = []
	
	jump_dir.list_dir_begin()
	for file: String in jump_dir.get_files():
		if ".import" not in file:
			var resource := jump_dir.get_current_dir() + "/" + file
			jump_sounds.append(resource)
			
	randomize()
	jump_sounds.shuffle()
	AUDIO.stream = load(jump_sounds[0])

func _on_hurtbox_body_entered(_body: Node2D) -> void:
	hide() # Player disappears after being hit.
