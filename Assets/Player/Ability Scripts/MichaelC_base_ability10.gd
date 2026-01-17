extends Node2D

@onready var player:Player 
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
	## Example: Increase Speed Button
	# multiplies move_speed and accel by 2
	player.move_speed *= 200
	player.acceleration *= 200
	player.jump_height *= 200
## called whenever the player just let go of Q. It is called once.
func ability_just_released():
	## Example: Increase Speed Button
	# divides move_speed and accel by 2, returning it to the original value.
	player.move_speed /= 200
	player.acceleration /= 200
	player.jump_height /= 200
	
