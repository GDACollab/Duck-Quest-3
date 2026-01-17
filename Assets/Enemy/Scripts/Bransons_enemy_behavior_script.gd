class_name LazyEnemyBehaviorScript extends EnemyBehaviorScript

func get_speed() -> float:
	return 10

func move(current_position: Vector2, player_position: Vector2, delta_time: float) -> Vector2:
	return (player_position - current_position).normalized() * get_speed() * delta_time * 500
