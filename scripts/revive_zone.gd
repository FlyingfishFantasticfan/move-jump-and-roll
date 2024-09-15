extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.reset_revive_position()
	pass # Replace with function body.
