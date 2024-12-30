extends Node2D
const DOOR_OFF = preload("res://assets/door_off.png")
const DOOR_ON = preload("res://assets/door_on.png")

var is_on = false
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	collision_shape_2d.disabled = is_on
	sprite_2d.texture = DOOR_ON if is_on else DOOR_OFF
