extends Node2D


@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var camera: Camera2D = %Camera2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

var limit_top
var limit_right
var limit_bottom
var limit_left

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var used := tile_map_layer.get_used_rect()
	var tile_size := tile_map_layer.tile_set.tile_size
	
	limit_top = used.position.y * tile_size.y
	limit_right = used.end.x * tile_size.x
	limit_bottom = used.end.y * tile_size.y
	limit_left = used.position.x * tile_size.x

	var rect_shape := RectangleShape2D.new()

	rect_shape.extents = Vector2((limit_right - limit_left) / 2, (limit_bottom - limit_top) / 2)
	collision_shape_2d.shape = rect_shape
	collision_shape_2d.position = Vector2((limit_right + limit_left) / 2, (limit_bottom + limit_top) / 2)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		camera.limit_bottom =limit_bottom
		camera.limit_left = limit_left
		camera.limit_right = limit_right
		camera.limit_top = limit_top
