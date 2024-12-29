@tool
extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D

@export var length:int = 4
@export var speed:float = 100
@export var update:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.region_rect.size.y = 16
	sprite_2d.region_rect.size.x = length * 16
	var rect_shape := RectangleShape2D.new()
	rect_shape.size = sprite_2d.region_rect.size
	collision_shape_2d.shape = rect_shape
	static_body_2d.constant_linear_velocity.x = speed
	if speed>=0:
		scale.x = 1
	else:
		scale.x = -1 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite_2d.region_rect.position.x -=  100 * delta
	if update:
		update= false
		sprite_2d.region_rect.size.y = 16
		sprite_2d.region_rect.size.x = length * 16
		var rect_shape := RectangleShape2D.new()
		rect_shape.size = sprite_2d.region_rect.size
		collision_shape_2d.shape = rect_shape
		static_body_2d.constant_linear_velocity.x = speed
		if speed>=0:
			scale.x = 1
		else:
			scale.x = -1 
