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
	if Input.is_action_just_pressed("map"):
		is_showing_map = not is_showing_map
		if is_showing_map:
			player.set_physics_process(true)
			camera.offset.y = 0
			camera.zoom.x = 1.5
			camera.zoom.y = 1.5
		else:
			player.set_physics_process(false)
			camera.offset.y = -500
			camera.zoom.x = 0.5
			camera.zoom.y = 0.5
			


func _on_coin_take_up() -> void:
	score += 1
	print(score)
	pass # Replace with function body.




func _on_player_dead() -> void:

	pass # Replace with function body.
