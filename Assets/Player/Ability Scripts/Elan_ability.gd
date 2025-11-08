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
	#makes the player jump mid-air
	player.velocity.y -= 700
	#Lets the dev know that this script is running b/c it has a 50/50 chance to run
	print("The right ability is being run")
	

## called whenever the player just let go of Q. It is called once.
func ability_just_released():
	pass
