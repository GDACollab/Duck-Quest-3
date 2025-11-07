extends Area2D


var interactable : bool = false
var interacting : bool = false

func _process(_delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Enter") and not interacting:
		interact()
		
func interact() -> void:
	interacting = true







func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = false
