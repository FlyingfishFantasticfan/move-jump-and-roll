extends Node2D

@onready var camera: Camera2D = $Player/Camera
@onready var player: CharacterBody2D = $Player
@onready var coins: Node2D = $Mid/Coins

var heath : int = 5
var score : int = 0
var num_coins: int = 0

var is_winning : bool =false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for child in coins.get_children():
		if child.name.begins_with("coin"):
			num_coins += 1
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
	if score == num_coins:
		print("full")
	pass # Replace with function body.
