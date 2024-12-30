@tool
extends Sprite2D
class_name  Portal

@onready var timer: Timer = $Timer

var can_transmission:bool = true:
	set(x):
		can_transmission = x
		timer.start()

@export var color:Color:
	set(x):
		color = x
		modulate = x
@export var target:Node2D
@export var wait_time:float = 1

func _ready() -> void:
	timer.wait_time = wait_time

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player && can_transmission:
		body.position = target.position
		if target is Portal:
			target.can_transmission = false

func _on_area_2d_body_exited(body: Node2D) -> void:
	can_transmission = true

func _on_timer_timeout() -> void:
	can_transmission = true
