@tool
extends CollisionPolygon2D
class_name CollisionArch2D

@export var arc_angle:float = 180 # 弧形的角度
@export var arc_radius:float = 100 # 弧形的半径
@export var arc_segments:int = 32 # 弧形的分段数
@export var arc_center:Vector2 = Vector2(0, 0) # 弧形的中心点
@export var arc_start:float = 0 # 弧形的起始角度

func _ready() -> void:
	_update_shape()

func _update_shape():
	var points = []
	var angle_step = deg_to_rad(arc_angle) / arc_segments
	var start_angle = deg_to_rad(arc_start) - deg_to_rad(arc_angle) / 2

	# Generate points for the arc
	for i in range(arc_segments + 1):
		var angle = start_angle + angle_step * i
		var x = arc_center.x + arc_radius * cos(angle)
		var y = arc_center.y + arc_radius * sin(angle)
		points.append(Vector2(x, y))

	# Add the center point to close the arc
	points.append(arc_center)

	# Set the points to the shape
	polygon = points
	

func set_arc_angle(angle: float):
	arc_angle = angle
	_update_shape()

func set_arc_radius(radius: float):
	arc_radius = radius
	_update_shape()

func set_arc_segments(segments: int):
	arc_segments = segments
	_update_shape()

func set_arc_center(center: Vector2):
	arc_center = center
	_update_shape()

func set_arc_start(start: float):
	arc_start = start
	_update_shape()

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		_update_shape()
