@tool
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

@export var length:float = 4
@export var update:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.region_rect.size.y = 16
	sprite_2d.region_rect.size.x = length * 16
	var rect_shape := RectangleShape2D.new()
	rect_shape.size.x = sprite_2d.region_rect.size.x
	collision_shape_2d.shape = rect_shape

func _process(delta: float) -> void:
	if update:
		update= false
		sprite_2d.region_rect.size.y = 16
		sprite_2d.region_rect.size.x = length * 16
		var rect_shape := RectangleShape2D.new()
		rect_shape.size.x = sprite_2d.region_rect.size.x
		collision_shape_2d.shape = rect_shape
