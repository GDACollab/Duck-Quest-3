class_name EnemyScript extends Node

func get_speed() -> float:
	return 25

## A MOVE FUNCTION THAT TAKES THESE PARAMETERS IS REQUIRED FOR THE ENEMY TO FUNCTION
func move(current_position: Vector2, player_position: Vector2, delta_time: float) -> Vector2:
	return player_position-current_position.normalized() * get_speed() * delta_time * 500
