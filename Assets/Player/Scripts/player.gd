extends CharacterBody2D

static var state_name: String = "Move"

@export var rotation_speed: float
@export var move_speed = 500
@export var acceleration = 1200


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
	move_and_slide()
