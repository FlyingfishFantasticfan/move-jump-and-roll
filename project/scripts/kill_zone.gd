extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body._dead()
	pass # Replace with function body.
