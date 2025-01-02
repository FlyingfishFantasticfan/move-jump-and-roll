extends Area2D
class_name  KillZone


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_die = true
