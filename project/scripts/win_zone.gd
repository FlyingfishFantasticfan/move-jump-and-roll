extends Area2D
signal win




	
func _on_body_entered(body: Node2D) -> void:
	emit_signal("win")

	pass # Replace with function body.
