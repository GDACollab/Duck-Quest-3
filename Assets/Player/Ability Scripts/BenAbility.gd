extends Node2D

@onready var player:Player 
#var bool: isGrounded
func _init() -> void:
	player = get_parent()
## Do not edit code above this line.


## Copy this ENTIRE script into your ability script
## Make sure it is inside of the Ability Script folder
## Then, edit and put whatever code you desire
# Here are some helpful variables you can modify
# player.move_speed 
# player.acceleration
# player.toggle_gravity
# player.jump_height
## you may do whatever, as long as it all happens within this script.
## feel free to declare variables and other functions as well.
## only modify your ability script and nothing else


## called whenever the player just pressed Q. It is called once.
func ability_just_pressed():
	## Doing a wall jump ability
	## pretty much just jump again lol
	if(player.is_on_wall()):
		print("Im ON A WALL - Ben ability")
		player.velocity.y = 0
		player.toggle_gravity(false)
	

## called whenever the player just let go of Q. It is called once.
func ability_just_released():
	## Doing a wall jump ability
	if(player.is_on_wall()):
		print("Im GOING OFF A WALL - Ben ability")
		player.velocity.y = -player.jump_height
		player.toggle_gravity(true)
