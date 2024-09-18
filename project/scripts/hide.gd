extends TileMapLayer

@onready var area_2d: Area2D = $Area2D

var defualt_color :Color
var entered_color :Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defualt_color = modulate
	entered_color = modulate
	entered_color.a = 0.3
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	area_2d.body_exited.connect(_on_area_2d_body_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("玩家进入")
	modulate = entered_color
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	modulate = defualt_color
	pass # Replace with function body.
