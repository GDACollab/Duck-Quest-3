extends EnemyBehaviorScript 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(current_position: Vector2, player_position: Vector2, delta_time: float) -> Vector2:
	return (player_position - current_position).normalized() * get_speed() * delta_time * 72000 
