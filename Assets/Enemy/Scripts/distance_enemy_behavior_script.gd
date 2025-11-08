# EXAMPLE
# YOUR CLASS SHOULD EXTEND EnemyBehaviorScript!
class_name DistanceEnemyBehaviorScript extends EnemyBehaviorScript

func get_speed() -> float:
	return 100

## A MOVE FUNCTION THAT TAKES THESE PARAMETERS IS REQUIRED FOR THE ENEMY TO FUNCTION
func move(current_position: Vector2, player_position: Vector2, delta_time: float) -> Vector2:
	if (player_position - current_position).length() < 300:
		return (player_position - current_position).normalized() * get_speed() * delta_time * 500
	else: 
		return Vector2()
