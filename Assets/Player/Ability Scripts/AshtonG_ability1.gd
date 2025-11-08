extends Node2D

@onready var player:Player 
func _init() -> void:
	player = get_parent()
## Do not edit code above this line.

var active = false;
@onready var mySign = preload("res://Assets/Sign/sign.tscn")

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
	player.move_speed *= 0.5
	player.acceleration *= 4
	active = true;
	player.get_child(1).modulate = Color(0,1,0)
	mySign = preload("res://Assets/Sign/sign.tscn")
	print(mySign.can_instantiate());
	var signer = mySign.instantiate();
	player.get_parent().add_child(signer);
	signer.position = player.position
	print(signer.position)
	print(signer.global_position)
	signer.get_child(2).text = "He's green for an amazing reason";
	

## called whenever the player just let go of Q. It is called once.
func ability_just_released():
	## Example: Increase Speed Button
	# divides move_speed and accel by 2, returning it to the original value.
	player.move_speed /= 0.5
	player.acceleration /= 4
	active = false;
	#player.get_child(1).modulate = Color(1,1,1)
	
#process doesn't work! unfortunate
#func _process(delta: float) -> void:
	#print("bluh");
	#if active:
		#player.get_child(1).modulate = Color(0,0.5,0)
	#pass
