extends Node2D

@onready var camera: Camera2D = $Player/Camera
@onready var player: CharacterBody2D = $Player

var heath : int = 5
var score : int = 0


var is_winning : bool =false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	if is_winning:
		player.set_physics_process(false)
		if Input.is_action_just_pressed("resume"):
			get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass
			


func _on_coin_take_up() -> void:
	score += 1
	print(score)
	pass # Replace with function body.


func _on_win_zone_win() -> void:
	is_winning = true
	pass # Replace with function body.
