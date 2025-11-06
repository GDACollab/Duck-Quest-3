extends Sprite2D

@onready var character_body = $"../CharacterBody2D"
var myTexture1 = load("res://Assets/Sprites/Player Sprites/duck.png")
var myTexture2 = load("res://Assets/Sprites/Player Sprites/duck2.png")

var textures_array = []

func _ready() -> void:
	textures_array.append(myTexture1)
	textures_array.append(myTexture2)
	
	texture = textures_array.pick_random()
	texture.
