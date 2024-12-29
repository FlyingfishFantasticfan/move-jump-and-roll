@tool
extends Node2D

@export var elasticity:float = 200
@onready var line_2d: Line2D = $Line2D
@onready var sprite: Sprite2D = $"Sprite-0002"
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for i in line_2d.points.size():
		if i%2==0:
			line_2d.points[i].x = 5
		else:
			line_2d.points[i].x = -5
		line_2d.points[i].y = i as float/line_2d.points.size() * sprite.position.y
		if i == line_2d.points.size() -1:
			line_2d.points[i] = sprite.position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		collision_shape_2d.disabled = true
		body.velocity += Vector2.from_angle(rotation-PI/2)*elasticity
		var tween:Tween = get_tree().create_tween()
		tween.tween_property(sprite,"position:y", -6 , 0.1).as_relative()
		tween.tween_property(sprite,"position:y",sprite.position.y , 0.1)
		tween.tween_callback(func():collision_shape_2d.disabled = false)
