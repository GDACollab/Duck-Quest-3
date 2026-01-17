extends EnemyBehaviorScript
var timer1 = 5.0
var waitOut = 10
func move(current_position: Vector2, player_position: Vector2, delta_time: float) -> Vector2:
	timer1 +=0.1
	if (timer1 > 20):
		
		return ((player_position - current_position).normalized() * get_speed() * delta_time) * 3000
	else:
		return ((player_position - current_position).normalized() * get_speed() * delta_time)  
		
	
func countDown():
	timer1 -= 1
	return timer1
