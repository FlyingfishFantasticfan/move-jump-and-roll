extends Node2D
@onready var area_2d: Area2D = $Sprite2D/Area2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player&&body.key_num > 0:
		body.key_num -= 1
		queue_free()
