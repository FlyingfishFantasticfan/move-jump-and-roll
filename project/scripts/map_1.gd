extends Node2D

@onready var camera: Camera2D = $Player/Camera
@onready var player: CharacterBody2D = $Player

var heath : int = 5
var score : int = 0

var is_showing_map : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
			


func _on_coin_take_up() -> void:
	score += 1
	print(score)
	pass # Replace with function body.


func _on_win_zone_win() -> void:
	
	pass # Replace with function body.
